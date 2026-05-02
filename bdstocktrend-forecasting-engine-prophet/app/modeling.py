from __future__ import annotations

import json
import logging
import math
import pickle
import shutil
import threading
from concurrent.futures import Future, ThreadPoolExecutor
from dataclasses import dataclass
from datetime import date, datetime, timedelta
from pathlib import Path
from typing import Any

import numpy as np
import pandas as pd

from app.config import settings
from app.db import get_db

logger = logging.getLogger(__name__)


@dataclass
class ModelMeta:
    code: str
    trained_until: date
    trained_at: datetime
    row_count: int
    strategy: str | None = None
    validation: dict[str, Any] | None = None
    residual_std: float | None = None


@dataclass(frozen=True)
class StrategyConfig:
    name: str
    yearly_seasonality: bool
    weekly_seasonality: bool
    seasonality_mode: str
    changepoint_prior_scale: float
    seasonality_prior_scale: float = 10.0  # Controls seasonality strength (lower = weaker seasonality)


_STRATEGIES: tuple[StrategyConfig, ...] = (
    StrategyConfig(
        name="baseline_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.10,  # Increased from 0.05 to capture more trend changes
        seasonality_prior_scale=5.0,  # Lower seasonality strength to let trend show through
    ),
    StrategyConfig(
        name="conservative_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.05,  # Keep conservative option
        seasonality_prior_scale=8.0,
    ),
    StrategyConfig(
        name="flexible_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.25,  # Increased from 0.20 for more flexibility
        seasonality_prior_scale=3.0,  # Very flexible with seasonality
    ),
    StrategyConfig(
        name="multiplicative",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="multiplicative",
        changepoint_prior_scale=0.15,  # Increased from 0.10
        seasonality_prior_scale=6.0,
    ),
)

_MIN_TRAIN_ROWS = 45
_DEFAULT_BACKTEST_POINTS = 12
_DEFAULT_HOLDOUT_DAYS = 30
_EXOG_COLS = ("open", "high", "low", "volume")
_BD_TRADING_DOWS = (6, 0, 1, 2, 3)


_executor = ThreadPoolExecutor(max_workers=settings.sync_max_workers)
_locks: dict[str, threading.Lock] = {}
_futures: dict[str, Future[None]] = {}
_locks_guard = threading.Lock()
_prophet_ready = False


def _lock_for(code: str) -> threading.Lock:
    with _locks_guard:
        lock = _locks.get(code)
        if lock is None:
            lock = threading.Lock()
            _locks[code] = lock
        return lock


def ensure_model_dir() -> Path:
    model_dir = Path(settings.model_dir)
    model_dir.mkdir(parents=True, exist_ok=True)
    return model_dir


def _ensure_prophet_ready() -> None:
    """Ensure Prophet can load a Stan backend.

    On Windows, the PyPI `prophet` wheel sometimes contains an incomplete bundled
    CmdStan directory (missing `makefile`), which makes `cmdstanpy.set_cmdstan_path`
    fail and causes Prophet initialization to break.

    Workaround: if the bundled directory exists but is incomplete, prevent Prophet
    from trying to use it so cmdstanpy falls back to the user's installed CmdStan.
    """

    global _prophet_ready
    if _prophet_ready:
        return

    try:
        import importlib.resources as importlib_resources
        import prophet.models as prophet_models

        stan_model_dir = Path(str(importlib_resources.files("prophet") / "stan_model"))

        # Ensure required runtime DLL is discoverable on Windows.
        # `prophet_model.bin` imports `tbb.dll` but the wheel may place it deep under
        # a bundled cmdstan directory, which Windows won't search by default.
        tbb_target = stan_model_dir / "tbb.dll"
        if not tbb_target.exists():
            candidates = [p for p in stan_model_dir.rglob("tbb.dll") if p != tbb_target]
            if candidates:
                shutil.copyfile(candidates[0], tbb_target)

        version = getattr(prophet_models.CmdStanPyBackend, "CMDSTAN_VERSION", None)
        if version:
            local_cmdstan_traversable = (
                importlib_resources.files("prophet")
                / "stan_model"
                / f"cmdstan-{version}"
            )
            local_cmdstan = Path(str(local_cmdstan_traversable))

            makefile = local_cmdstan / "makefile"
            if local_cmdstan.exists() and not makefile.exists():
                # Disable bundled cmdstan usage by pointing to a non-existent version.
                prophet_models.CmdStanPyBackend.CMDSTAN_VERSION = "disabled"
    except Exception:
        # If anything goes wrong here, let Prophet try its normal behavior.
        pass

    _prophet_ready = True


def _model_paths(code: str) -> tuple[Path, Path]:
    model_dir = ensure_model_dir() / code
    model_dir.mkdir(parents=True, exist_ok=True)
    # - Prophet stores JSON in model.json
    # - statsmodels-based models store pickle in model.pkl
    # We keep both names to support migration without breaking existing installs.
    return model_dir / "model.json", model_dir / "meta.json"


def _pickle_path(code: str) -> Path:
    model_dir = ensure_model_dir() / code
    model_dir.mkdir(parents=True, exist_ok=True)
    return model_dir / "model.pkl"


def _db_max_date(code: str) -> date | None:
    db = get_db()
    with db.pool.connection() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT MAX(date) FROM historical_stocks_data WHERE code = %s",
                (code,),
            )
            row = cur.fetchone()
            if not row or row[0] is None:
                return None
            return row[0]


def _load_series(code: str, include_exog: bool = False) -> pd.DataFrame:
    db = get_db()
    with db.pool.connection() as conn:
        with conn.cursor() as cur:
            if include_exog:
                try:
                    cur.execute(
                        "SELECT date, close, open, high, low, volume "
                        "FROM historical_stocks_data "
                        "WHERE code = %s AND close IS NOT NULL ORDER BY date ASC",
                        (code,),
                    )
                    rows = cur.fetchall()
                except Exception:
                    # Fallback to close-only if exogenous columns are unavailable.
                    cur.execute(
                        "SELECT date, close FROM historical_stocks_data "
                        "WHERE code = %s AND close IS NOT NULL ORDER BY date ASC",
                        (code,),
                    )
                    rows = cur.fetchall()
            else:
                cur.execute(
                    "SELECT date, close FROM historical_stocks_data "
                    "WHERE code = %s AND close IS NOT NULL ORDER BY date ASC",
                    (code,),
                )
                rows = cur.fetchall()

    if not rows:
        return pd.DataFrame(columns=["ds", "y"])

    if include_exog and len(rows[0]) >= 6:
        df = pd.DataFrame(rows, columns=["ds", "y", "open", "high", "low", "volume"])
    else:
        df = pd.DataFrame(rows, columns=["ds", "y"])
    df["ds"] = pd.to_datetime(df["ds"])
    df["y"] = pd.to_numeric(df["y"], errors="coerce")
    if include_exog and all(col in df.columns for col in _EXOG_COLS):
        for col in _EXOG_COLS:
            df[col] = pd.to_numeric(df[col], errors="coerce")
        df[_EXOG_COLS] = df[_EXOG_COLS].ffill().bfill()
        df = df.dropna(subset=["ds", "y", *_EXOG_COLS]).sort_values("ds")
    else:
        df = df.dropna(subset=["ds", "y"]).sort_values("ds")
    df = df.drop_duplicates(subset=["ds"], keep="last")
    return df


def _price_bucket(last_close: float | None) -> str | None:
    if last_close is None or math.isnan(last_close):
        return None
    if last_close < 50:
        return "0-50"
    if last_close < 100:
        return "50-100"
    if last_close < 200:
        return "100-200"
    if last_close < 300:
        return "200-300"
    if last_close < 400:
        return "300-400"
    return "400+"


def _preferred_models_for_bucket(bucket: str | None) -> list[str]:
    if bucket == "0-50":
        return ["telr", "arima(1,1,1)"]
    if bucket == "50-100":
        return ["telr", "prophet:baseline_additive"]
    if bucket == "100-200":
        return ["telr", "prophet:baseline_additive"]
    if bucket == "200-300":
        return ["prophet:baseline_additive", "sarimax(1,1,1)"]
    if bucket == "300-400":
        return ["prophet:baseline_additive", "telr"]
    if bucket == "400+":
        return ["prophet:baseline_additive", "telr"]
    return []


def _read_meta(code: str) -> ModelMeta | None:
    _, meta_path = _model_paths(code)
    if not meta_path.exists():
        return None
    data = json.loads(meta_path.read_text(encoding="utf-8"))
    return ModelMeta(
        code=code,
        trained_until=date.fromisoformat(data["trained_until"]),
        trained_at=datetime.fromisoformat(data["trained_at"]),
        row_count=int(data.get("row_count", 0)),
        strategy=data.get("strategy"),
        validation=data.get("validation"),
        residual_std=(float(data["residual_std"]) if data.get("residual_std") is not None else None),
    )


def _write_meta(meta: ModelMeta) -> None:
    _, meta_path = _model_paths(meta.code)
    meta_path.write_text(
        json.dumps(
            {
                "code": meta.code,
                "trained_until": meta.trained_until.isoformat(),
                "trained_at": meta.trained_at.isoformat(),
                "row_count": meta.row_count,
                "strategy": meta.strategy,
                "validation": meta.validation,
                "residual_std": meta.residual_std,
            },
            ensure_ascii=False,
        ),
        encoding="utf-8",
    )


def _build_prophet(strategy: StrategyConfig):
    _ensure_prophet_ready()
    from prophet import Prophet

    return Prophet(
        interval_width=settings.interval_width,
        yearly_seasonality=strategy.yearly_seasonality,
        weekly_seasonality=strategy.weekly_seasonality,
        daily_seasonality=False,
        seasonality_mode=strategy.seasonality_mode,
        changepoint_prior_scale=strategy.changepoint_prior_scale,
        seasonality_prior_scale=strategy.seasonality_prior_scale,
    )


def _rmse(trues: list[float], preds: list[float]) -> float:
    if not trues:
        return float("inf")
    err_sq = [(a - p) ** 2 for a, p in zip(trues, preds)]
    return float((sum(err_sq) / len(err_sq)) ** 0.5)


def _mae(trues: list[float], preds: list[float]) -> float:
    if not trues:
        return float("inf")
    err_abs = [abs(a - p) for a, p in zip(trues, preds)]
    return float(sum(err_abs) / len(err_abs))


def _mape(trues: list[float], preds: list[float]) -> float:
    if not trues:
        return float("inf")
    err_pct = [_safe_mape(a, p) for a, p in zip(trues, preds)]
    return float(sum(err_pct) / len(err_pct))


def _std(values: list[float]) -> float:
    if len(values) < 2:
        return 0.0
    mean = sum(values) / len(values)
    var = sum((v - mean) ** 2 for v in values) / (len(values) - 1)
    return float(var ** 0.5)


def _pfe(trues: list[float], preds: list[float]) -> float:
    """Percentage Forecast Error (PFE), approximated.

    The paper defines: PFE = 2 * Sd / Ŷ_{t+1} * 100%.

    For multi-step holdout evaluation, we approximate Ŷ_{t+1} using the mean
    absolute predicted value over the holdout horizon.
    """

    if not trues:
        return float("inf")
    errors = [a - p for a, p in zip(trues, preds)]
    sd = _std(errors)
    denom = float(sum(abs(p) for p in preds) / len(preds)) if preds else 0.0
    if denom <= 0:
        return float("inf")
    return float(2.0 * sd / denom * 100.0)


def _default_holdout(df: pd.DataFrame) -> int:
    # Use last N trading rows as holdout; cap so we always have at least MIN_TRAIN_ROWS.
    if len(df) <= (_MIN_TRAIN_ROWS + 1):
        return 0
    return min(_DEFAULT_HOLDOUT_DAYS, len(df) - _MIN_TRAIN_ROWS)


def _split_holdout(df: pd.DataFrame, holdout: int) -> tuple[pd.DataFrame, pd.DataFrame]:
    if holdout <= 0:
        return df, df.iloc[0:0]
    return df.iloc[:-holdout].copy(), df.iloc[-holdout:].copy()


def _eval_metrics(trues: list[float], preds: list[float]) -> dict[str, Any]:
    if not trues or not preds:
        return {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None}
    errors = [a - p for a, p in zip(trues, preds)]
    return {
        "rmse": round(_rmse(trues, preds), 6),
        "mape": round(_mape(trues, preds), 6),
        "mae": round(_mae(trues, preds), 6),
        "pfe": round(_pfe(trues, preds), 6),
        "residual_std": round(_std(errors), 6),
    }


def _rank_key(metrics: dict[str, Any], flat_penalty: float) -> tuple[float, float, float, float]:
    """Rank key: flat penalty first, then PFE, MAPE, RMSE (paper-aligned)."""

    if not metrics or metrics.get("rmse") is None:
        return (float("inf"), float("inf"), float("inf"), float("inf"))
    rmse = float(metrics.get("rmse") or 0.0)
    mape = float(metrics.get("mape") or 0.0)
    pfe = float(metrics.get("pfe") or 0.0)
    return (float(flat_penalty), pfe, mape, rmse)


def _weighted_score(metrics: dict[str, Any]) -> float:
    """Compatibility score for logs/clients; smaller is better."""

    if not metrics or metrics.get("rmse") is None:
        return float("inf")
    rmse = float(metrics.get("rmse") or 0.0)
    mape = float(metrics.get("mape") or 0.0)
    pfe = float(metrics.get("pfe") or 0.0)
    return (0.6 * rmse) + (0.3 * mape) + (0.1 * pfe)


def _flat_penalty(trues: list[float], preds: list[float]) -> float:
    """Return a large penalty when forecasts are flat but actuals are not."""

    if not preds:
        return float("inf")
    true_std = _std(trues)
    pred_std = _std(preds)
    if true_std <= 0:
        return 0.0
    if pred_std < max(1e-6, true_std * 0.05):
        return 1e6
    return 0.0


def _metrics_close(candidate: dict[str, Any], best: dict[str, Any], rel_tol: float = 0.05) -> bool:
    if not candidate or not best:
        return False
    for key in ("pfe", "mape", "rmse"):
        cand = candidate.get(key)
        base = best.get(key)
        if cand is None or base is None:
            return False
        if abs(float(cand) - float(base)) > max(1e-6, float(base) * rel_tol):
            return False
    return True


def _predict_prophet_on_dates(train_df: pd.DataFrame, future_ds: list[pd.Timestamp], strategy: StrategyConfig) -> list[float]:
    model = _build_prophet(strategy)
    model.fit(train_df[["ds", "y"]])
    pred_df = model.predict(pd.DataFrame({"ds": future_ds}))
    return [float(v) for v in pred_df["yhat"].tolist()]


def _fit_prophet_full(df: pd.DataFrame, strategy: StrategyConfig):
    model = _build_prophet(strategy)
    model.fit(df[["ds", "y"]])
    return model


def _fit_statsmodels_arima(series: pd.Series, exog: pd.DataFrame | None = None):
    # Lazy import to keep engine lightweight when users only want Prophet.
    from statsmodels.tsa.arima.model import ARIMA

    # Standard ARIMA: d=1 (first differencing) + drift for trend preservation.
    # Keeps accuracy while avoiding flat forecasts.
    return ARIMA(series, order=(1, 1, 1), trend="t").fit()


def _fit_statsmodels_arima_drift(series: pd.Series, exog: pd.DataFrame | None = None):
    """ARIMA with higher differencing for strong trending series.

    Uses d=2 to capture acceleration/deceleration in trend.
    More aggressive than standard ARIMA but better for highly trending data.
    """

    from statsmodels.tsa.arima.model import ARIMA

    return ARIMA(series, order=(1, 2, 1), trend="t").fit()


def _fit_statsmodels_sarimax(series: pd.Series, exog: pd.DataFrame | None = None):
    from statsmodels.tsa.statespace.sarimax import SARIMAX

    # Keep d=1 for stability, but add seasonal differencing (D=1) for trend capture.
    return SARIMAX(
        series,
        exog=exog,
        order=(1, 1, 1),
        seasonal_order=(0, 1, 0, 5),
        enforce_stationarity=False,
        enforce_invertibility=False,
    ).fit(disp=False)


def _fit_statsmodels_sarimax_weekly(series: pd.Series, exog: pd.DataFrame | None = None):
    """SARIMAX with a simple weekly seasonal component (s=5 trading days)."""

    from statsmodels.tsa.statespace.sarimax import SARIMAX

    return SARIMAX(
        series,
        exog=exog,
        order=(1, 1, 1),
        seasonal_order=(1, 1, 1, 5),
        enforce_stationarity=False,
        enforce_invertibility=False,
    ).fit(disp=False)


def _fit_ses(series: pd.Series):
    from statsmodels.tsa.holtwinters import SimpleExpSmoothing

    return SimpleExpSmoothing(series, initialization_method="estimated").fit()


def _fit_hwes(series: pd.Series):
    from statsmodels.tsa.holtwinters import ExponentialSmoothing

    seasonal_periods = 5
    # If too short for seasonality, fall back to trend only.
    if len(series) < (2 * seasonal_periods + 1):
        return ExponentialSmoothing(series, trend="add", seasonal=None, initialization_method="estimated").fit()
    return ExponentialSmoothing(
        series,
        trend="add",
        seasonal="add",
        seasonal_periods=seasonal_periods,
        initialization_method="estimated",
    ).fit()


def _extract_exog(df: pd.DataFrame) -> pd.DataFrame | None:
    if not all(col in df.columns for col in _EXOG_COLS):
        return None
    exog = df[list(_EXOG_COLS)].copy()
    return exog if not exog.empty else None


def _future_exog(df: pd.DataFrame, steps: int) -> pd.DataFrame | None:
    exog = _extract_exog(df)
    if exog is None or exog.empty:
        return None
    last = exog.iloc[-1].to_numpy(dtype=float)
    return pd.DataFrame([last] * steps, columns=exog.columns)


def _telr_changepoints(n: int) -> np.ndarray:
    if n < 10:
        return np.array([])
    points = min(8, max(1, n // 60))
    idx = (np.linspace(0.1, 0.9, points) * (n - 1)).astype(int)
    return idx.astype(float)


def _telr_features(
    dates: list[pd.Timestamp],
    t_index: np.ndarray,
    changepoints: np.ndarray,
    dow_order: tuple[int, ...],
) -> np.ndarray:
    t_index = t_index.astype(float)
    features: list[np.ndarray] = [
        np.ones_like(t_index, dtype=float),
        t_index,
    ]
    for cp in changepoints:
        features.append(np.maximum(0.0, t_index - cp))
    dow = pd.to_datetime(pd.Series(dates)).dt.weekday.to_numpy()
    for d in dow_order[:-1]:
        features.append((dow == d).astype(float))
    return np.vstack(features).T


def _fit_telr(train_df: pd.DataFrame) -> dict[str, Any]:
    dates = [pd.to_datetime(v) for v in train_df["ds"].tolist()]
    y = np.asarray(train_df["y"].tolist(), dtype=float)
    n = len(y)
    t_index = np.arange(n, dtype=float)
    changepoints = _telr_changepoints(n)
    X = _telr_features(dates, t_index, changepoints, _BD_TRADING_DOWS)
    coeffs, _, _, _ = np.linalg.lstsq(X, y, rcond=None)
    return {
        "type": "telr",
        "coeffs": coeffs.tolist(),
        "changepoints": changepoints.tolist(),
        "train_len": n,
        "dow_order": list(_BD_TRADING_DOWS),
    }


def _predict_telr_from_model(model: dict[str, Any], future_ds: list[pd.Timestamp]) -> list[float]:
    train_len = int(model.get("train_len", 0))
    if train_len <= 0:
        return []
    t_index = np.arange(train_len, train_len + len(future_ds), dtype=float)
    changepoints = np.asarray(model.get("changepoints", []), dtype=float)
    dow_order = tuple(int(v) for v in model.get("dow_order", _BD_TRADING_DOWS))
    X = _telr_features([pd.to_datetime(v) for v in future_ds], t_index, changepoints, dow_order)
    coeffs = np.asarray(model.get("coeffs", []), dtype=float)
    if coeffs.size == 0:
        return []
    return [float(v) for v in (X @ coeffs).tolist()]


def _predict_telr_on_dates(train_df: pd.DataFrame, future_ds: list[pd.Timestamp]) -> list[float]:
    model = _fit_telr(train_df)
    return _predict_telr_from_model(model, future_ds)


def _series_from_df(df: pd.DataFrame) -> pd.Series:
    # Treat trading days as equally spaced steps.
    return pd.Series([float(v) for v in df["y"].tolist()])


def _evaluate_algorithms(df: pd.DataFrame, holdout: int) -> tuple[dict[str, Any], str, float | None]:
    """Evaluate multiple algorithms on last-N holdout; return details + winner."""
    last_close = float(df["y"].iloc[-1]) if not df.empty else None
    price_bucket = _price_bucket(last_close)
    preferred_models = _preferred_models_for_bucket(price_bucket)

    train_df, test_df = _split_holdout(df, holdout)
    if test_df.empty or len(train_df) < _MIN_TRAIN_ROWS:
        # Default: Prophet baseline without validation.
        return (
            {
                "holdout": holdout,
                "selected": "prophet:baseline_additive",
                "evaluations": [],
                "price_bucket": price_bucket,
                "preferred_models": preferred_models,
            },
            "prophet:baseline_additive",
            None,
        )

    future_ds = [pd.to_datetime(v) for v in test_df["ds"].tolist()]
    trues = [float(v) for v in test_df["y"].tolist()]
    exog_all = _extract_exog(df)
    train_exog = exog_all.loc[train_df.index] if exog_all is not None else None
    test_exog = exog_all.loc[test_df.index] if exog_all is not None else None

    evaluations: list[dict[str, Any]] = []

    # --- Prophet strategies ---
    for strategy in _STRATEGIES:
        try:
            preds = _predict_prophet_on_dates(train_df, future_ds, strategy)
            metrics = _eval_metrics(trues, preds)
            flat_penalty = _flat_penalty(trues, preds)
            evaluations.append(
                {
                    "model": f"prophet:{strategy.name}",
                    "metrics": metrics,
                    "flat_penalty": flat_penalty,
                    "rank_key": _rank_key(metrics, flat_penalty),
                    "score": round(_weighted_score(metrics), 6),
                }
            )
        except Exception as e:
            evaluations.append(
                {
                    "model": f"prophet:{strategy.name}",
                    "metrics": {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None},
                    "flat_penalty": float("inf"),
                    "rank_key": (float("inf"), float("inf"), float("inf"), float("inf")),
                    "score": float("inf"),
                    "error": str(e),
                }
            )

    # --- TELR (trend estimating linear regression) ---
    try:
        preds = _predict_telr_on_dates(train_df, future_ds)
        metrics = _eval_metrics(trues, preds)
        flat_penalty = _flat_penalty(trues, preds)
        evaluations.append(
            {
                "model": "telr",
                "metrics": metrics,
                "flat_penalty": flat_penalty,
                "rank_key": _rank_key(metrics, flat_penalty),
                "score": round(_weighted_score(metrics), 6),
            }
        )
    except Exception as e:
        evaluations.append(
            {
                "model": "telr",
                "metrics": {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None},
                "flat_penalty": float("inf"),
                "rank_key": (float("inf"), float("inf"), float("inf"), float("inf")),
                "score": float("inf"),
                "error": str(e),
            }
        )

    # --- Classic time series models (close only) ---
    train_series = _series_from_df(train_df)

    def _eval_stats_model(
        name: str,
        fit_fn,
        exog_train: pd.DataFrame | None = None,
        exog_test: pd.DataFrame | None = None,
    ) -> None:
        try:
            fitted = fit_fn(train_series, exog_train)

            # Prefer forecast with steps.
            forecast = None
            if hasattr(fitted, "get_forecast"):
                forecast = fitted.get_forecast(steps=len(test_df), exog=exog_test)
                preds = [float(v) for v in forecast.predicted_mean.tolist()]
            elif hasattr(fitted, "forecast"):
                if exog_test is not None:
                    preds = [float(v) for v in fitted.forecast(steps=len(test_df), exog=exog_test).tolist()]
                else:
                    preds = [float(v) for v in fitted.forecast(steps=len(test_df)).tolist()]
            else:
                preds = []

            metrics = _eval_metrics(trues, preds)
            flat_penalty = _flat_penalty(trues, preds)
            evaluations.append(
                {
                    "model": name,
                    "metrics": metrics,
                    "flat_penalty": flat_penalty,
                    "rank_key": _rank_key(metrics, flat_penalty),
                    "score": round(_weighted_score(metrics), 6),
                }
            )
        except Exception as e:
            evaluations.append(
                {
                    "model": name,
                    "metrics": {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None},
                    "flat_penalty": float("inf"),
                    "rank_key": (float("inf"), float("inf"), float("inf"), float("inf")),
                    "score": float("inf"),
                    "error": str(e),
                }
            )

    _eval_stats_model("arima(1,1,1)", _fit_statsmodels_arima)
    _eval_stats_model("arima(1,1,1)+drift", _fit_statsmodels_arima_drift)
    _eval_stats_model("sarimax(1,1,1)", _fit_statsmodels_sarimax, train_exog, test_exog)
    _eval_stats_model("sarimax(1,1,1)x(1,1,1,5)", _fit_statsmodels_sarimax_weekly, train_exog, test_exog)
    # Removed SES and HWES because they use exponential smoothing which
    # always produces flat forecasts (repeats the last value).
    # They fail to capture trend changes. ARIMA/SARIMAX with differencing work much better.

    ranked = sorted(evaluations, key=lambda item: tuple(item.get("rank_key", (float("inf"),) * 4)))
    winner = ranked[0]["model"] if ranked else "prophet:baseline_additive"
    residual_std = None
    if ranked and isinstance(ranked[0].get("metrics"), dict):
        residual_std = ranked[0]["metrics"].get("residual_std")

    if preferred_models and ranked:
        best_metrics = ranked[0].get("metrics") or {}
        for model_name in preferred_models:
            candidate = next((item for item in ranked if item.get("model") == model_name), None)
            if not candidate:
                continue
            if float(candidate.get("flat_penalty") or 0.0) > 0.0:
                continue
            if _metrics_close(candidate.get("metrics") or {}, best_metrics):
                winner = candidate["model"]
                residual_std = candidate.get("metrics", {}).get("residual_std")
                break

    return (
        {
            "holdout": holdout,
            "selected": winner,
            "evaluations": ranked,
            "price_bucket": price_bucket,
            "preferred_models": preferred_models,
        },
        winner,
        (float(residual_std) if residual_std is not None else None),
    )


def _safe_mape(actual: float, pred: float) -> float:
    if actual == 0:
        return 0.0
    return abs((actual - pred) / actual) * 100.0


def _rolling_backtest(
    df: pd.DataFrame,
    strategy: StrategyConfig,
    points: int,
) -> dict[str, Any]:
    n = len(df)
    points = max(1, min(points, n - _MIN_TRAIN_ROWS))
    start_idx = n - points

    preds: list[float] = []
    trues: list[float] = []

    for i in range(start_idx, n):
        train_df = df.iloc[:i][["ds", "y"]]
        target_row = df.iloc[i]
        target_ds = pd.to_datetime(target_row["ds"])
        target_y = float(target_row["y"])

        if len(train_df) < _MIN_TRAIN_ROWS:
            continue

        try:
            model = _build_prophet(strategy)
            model.fit(train_df)
            pred_df = model.predict(pd.DataFrame({"ds": [target_ds]}))
            yhat = float(pred_df.iloc[0]["yhat"])
        except Exception:
            continue

        if math.isnan(yhat):
            continue

        preds.append(yhat)
        trues.append(target_y)

    if not preds:
        return {
            "strategy": strategy.name,
            "points_used": 0,
            "mae": None,
            "rmse": None,
            "mape": None,
            "score": float("inf"),
        }

    err_abs = [abs(a - p) for a, p in zip(trues, preds)]
    err_sq = [(a - p) ** 2 for a, p in zip(trues, preds)]
    err_pct = [_safe_mape(a, p) for a, p in zip(trues, preds)]

    mae = float(sum(err_abs) / len(err_abs))
    rmse = float((sum(err_sq) / len(err_sq)) ** 0.5)
    mape = float(sum(err_pct) / len(err_pct))

    # Weighted score to balance absolute and percentage errors.
    score = (0.5 * mae) + (0.3 * rmse) + (0.2 * mape)
    return {
        "strategy": strategy.name,
        "points_used": len(preds),
        "mae": round(mae, 6),
        "rmse": round(rmse, 6),
        "mape": round(mape, 6),
        "score": round(score, 6),
    }


def _choose_strategy(df: pd.DataFrame) -> tuple[StrategyConfig, list[dict[str, Any]]]:
    if len(df) < (_MIN_TRAIN_ROWS + 3):
        # Not enough rows for robust backtesting; choose a conservative default.
        return _STRATEGIES[0], []

    points = min(_DEFAULT_BACKTEST_POINTS, len(df) - _MIN_TRAIN_ROWS)
    evaluations = [_rolling_backtest(df, strategy, points) for strategy in _STRATEGIES]
    ranked = sorted(evaluations, key=lambda item: float(item["score"]))
    winner_name = ranked[0]["strategy"]
    winner = next((s for s in _STRATEGIES if s.name == winner_name), _STRATEGIES[0])
    return winner, ranked


def _load_model(code: str) -> Prophet | None:
    _ensure_prophet_ready()
    from prophet.serialize import model_from_json

    model_path, _ = _model_paths(code)
    if not model_path.exists():
        return None
    return model_from_json(model_path.read_text(encoding="utf-8"))


def _save_model(code: str, model: Prophet) -> None:
    _ensure_prophet_ready()
    from prophet.serialize import model_to_json

    model_path, _ = _model_paths(code)
    model_path.write_text(model_to_json(model), encoding="utf-8")


def _save_pickle_model(code: str, model: Any) -> None:
    path = _pickle_path(code)
    path.write_bytes(pickle.dumps(model, protocol=pickle.HIGHEST_PROTOCOL))


def _load_pickle_model(code: str) -> Any | None:
    path = _pickle_path(code)
    if not path.exists():
        return None
    return pickle.loads(path.read_bytes())


def train_model(code: str) -> None:
    logger.info(f"[TRAIN_START] Training model for code={code}")
    df = _load_series(code, include_exog=True)
    if df.empty or len(df) < 2:
        logger.error(f"[TRAIN_ERROR] Not enough data for code={code}, rows={len(df)}")
        raise ValueError(f"Not enough data to train model for code={code}")

    logger.info(f"[TRAIN_DATA] code={code}, historical_data_points={len(df)}, date_range={df['ds'].min()}_to_{df['ds'].max()}")

    holdout = _default_holdout(df)
    validation, selected_model, residual_std = _evaluate_algorithms(df, holdout)
    logger.info(f"[TRAIN_STRATEGY] code={code}, selected={selected_model}, holdout={holdout}")

    # Fit the selected model on full history.
    if selected_model.startswith("prophet:"):
        selected_strategy = selected_model.split(":", 1)[1]
        strategy = next((s for s in _STRATEGIES if s.name == selected_strategy), _STRATEGIES[0])
        model = _fit_prophet_full(df, strategy)
        _save_model(code, model)
    else:
        series = _series_from_df(df)
        fitted = None
        if selected_model.startswith("arima"):
            if "+drift" in selected_model:
                fitted = _fit_statsmodels_arima_drift(series)
            else:
                fitted = _fit_statsmodels_arima(series)
        elif selected_model.startswith("sarimax"):
            if "x(1,1,1,5)" in selected_model or "x(1,0,1,5)" in selected_model:
                fitted = _fit_statsmodels_sarimax_weekly(series, _extract_exog(df))
            else:
                fitted = _fit_statsmodels_sarimax(series, _extract_exog(df))
        elif selected_model == "telr":
            fitted = _fit_telr(df)
        else:
            # Fallback to Prophet if something unexpected happens (e.g., old model type).
            strategy = _STRATEGIES[0]
            model = _fit_prophet_full(df, strategy)
            selected_model = f"prophet:{strategy.name}"
            _save_model(code, model)

        if fitted is not None:
            _save_pickle_model(code, fitted)

    trained_until = df["ds"].max().date()
    _write_meta(
        ModelMeta(
            code=code,
            trained_until=trained_until,
            trained_at=datetime.utcnow(),
            row_count=len(df),
            strategy=selected_model,
            validation=validation,
            residual_std=residual_std,
        )
    )
    logger.info(f"[TRAIN_DONE] Model trained for code={code}, trained_until={trained_until}")


def _train_model_locked(code: str) -> None:
    lock = _lock_for(code)
    with lock:
        train_model(code)


def ensure_trained(code: str) -> None:
    lock = _lock_for(code)
    with lock:
        meta = _read_meta(code)
        db_max = _db_max_date(code)

        if db_max is None:
            raise ValueError(f"No historical data found for code={code}")

        if meta is not None and meta.trained_until >= db_max:
            return

        train_model(code)


def schedule_training(code: str) -> None:
    lock = _lock_for(code)
    with lock:
        existing = _futures.get(code)
        if existing and not existing.done():
            return
        # Avoid unnecessary retraining: only train if DB has newer data.
        # `ensure_trained()` is lock-safe (it takes the per-code lock itself).
        _futures[code] = _executor.submit(ensure_trained, code)


def list_codes() -> list[str]:
    db = get_db()
    with db.pool.connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT DISTINCT code FROM company WHERE code IS NOT NULL ORDER BY code ASC")
            return [r[0] for r in cur.fetchall() if r and r[0]]


def _is_bd_trading_day(d: date) -> bool:
    # Bangladesh stock market trading days are typically Sunday-Thursday.
    # Python weekday(): Mon=0 ... Sun=6
    return d.weekday() in (6, 0, 1, 2, 3)


def _next_bd_trading_days(start: date, n: int) -> list[pd.Timestamp]:
    out: list[pd.Timestamp] = []
    d = start
    while len(out) < n:
        d = d + timedelta(days=1)
        if _is_bd_trading_day(d):
            out.append(pd.Timestamp(d))
    return out


def forecast_next_days(code: str) -> list[dict[str, Any]]:
    logger.info(f"[FORECAST_START] code={code}")
    ensure_trained(code)
    meta = _read_meta(code)
    selected = meta.strategy if meta else None

    prophet_model = None
    sm_model = None
    if selected and selected.startswith("prophet:"):
        prophet_model = _load_model(code)
    elif selected:
        sm_model = _load_pickle_model(code)
    else:
        # Backward compatibility: older meta stored just prophet strategy name.
        prophet_model = _load_model(code)

    if prophet_model is None and sm_model is None:
        logger.error(f"[FORECAST_ERROR] Model missing after training for code={code}")
        raise RuntimeError(f"Model missing after training for code={code}")

    # Load historical data for trend estimation and exogenous features.
    df = _load_series(code, include_exog=True)
    
    # Forecast next N Bangladesh trading days (Sun-Thu), skipping Fri/Sat.
    last_observed = _db_max_date(code)
    if last_observed is None:
        logger.error(f"[FORECAST_ERROR] No historical data found for code={code}")
        raise ValueError(f"No historical data found for code={code}")
    
    logger.info(f"[FORECAST_DATA] code={code}, last_observed={last_observed}, forecast_days={settings.forecast_days}")
    future_ds = _next_bd_trading_days(last_observed, settings.forecast_days)

    if prophet_model is not None:
        future = pd.DataFrame({"ds": future_ds})
        forecast = prophet_model.predict(future)
        rows_iter = forecast.iterrows()
        row_to_pred = lambda row: (
            float(row["yhat"]) if pd.notna(row["yhat"]) else None,
            float(row["yhat_lower"]) if pd.notna(row["yhat_lower"]) else None,
            float(row["yhat_upper"]) if pd.notna(row["yhat_upper"]) else None,
        )
    else:
        # statsmodels path
        steps = len(future_ds)
        yhat: list[float]
        lower: list[float] | None = None
        upper: list[float] | None = None

        if isinstance(sm_model, dict) and sm_model.get("type") == "telr":
            yhat = _predict_telr_from_model(sm_model, future_ds)
        else:
            exog_future = None
            if hasattr(sm_model, "model"):
                model_exog = getattr(sm_model.model, "exog", None)
                if model_exog is not None and np.size(model_exog) > 0:
                    exog_future = _future_exog(df, steps)

            if hasattr(sm_model, "get_forecast"):
                fc = sm_model.get_forecast(steps=steps, exog=exog_future)
                yhat = [float(v) for v in fc.predicted_mean.tolist()]
                try:
                    alpha = 1.0 - float(settings.interval_width)
                    ci = fc.conf_int(alpha=alpha)
                    # columns may be named like "lower y" / "upper y".
                    lower = [float(v) for v in ci.iloc[:, 0].tolist()]
                    upper = [float(v) for v in ci.iloc[:, 1].tolist()]
                except Exception:
                    lower = None
                    upper = None
            elif hasattr(sm_model, "forecast"):
                if exog_future is not None:
                    yhat = [float(v) for v in sm_model.forecast(steps=steps, exog=exog_future).tolist()]
                else:
                    yhat = [float(v) for v in sm_model.forecast(steps=steps).tolist()]
            else:
                yhat = []

        residual_std = float(meta.residual_std) if (meta and meta.residual_std is not None) else 0.0
        
        # Workaround: if forecast is suspiciously flat (no variation), add historical trend
        # Only apply if: (1) variance is near-zero, (2) historical data shows clear trend
        if yhat and len(yhat) > 5:
            yhat_std = float(_std(yhat)) if len(yhat) > 1 else 0.0
            # Threshold: if forecast std is <5% of residual std, it's likely flat
            if residual_std > 0 and yhat_std < (residual_std * 0.05):
                # Estimate trend from last 10 historical values
                last_10 = [float(v) for v in df.iloc[-10:]["y"].tolist()]
                if len(last_10) >= 5:
                    hist_std = float(_std(last_10))
                    # Only add trend if historical data is NOT flat
                    if hist_std > (residual_std * 0.1):
                        recent_trend = (last_10[-1] - last_10[0]) / len(last_10)
                        trend_factor = recent_trend * 0.5  # Damped: only 50% of historical trend
                        yhat = [v + (trend_factor * (i + 1)) for i, v in enumerate(yhat)]
                        logger.info(f"[TREND_BOOST] Applied trend boost to flat forecast, trend={trend_factor:.6f}")
        
        if lower is None or upper is None:
            lower = [v - (2.0 * residual_std) for v in yhat]
            upper = [v + (2.0 * residual_std) for v in yhat]

        forecast = pd.DataFrame({
            "ds": future_ds,
            "yhat": yhat,
            "yhat_lower": lower,
            "yhat_upper": upper,
        })
        rows_iter = forecast.iterrows()
        row_to_pred = lambda row: (
            float(row["yhat"]) if pd.notna(row["yhat"]) else None,
            float(row["yhat_lower"]) if pd.notna(row["yhat_lower"]) else None,
            float(row["yhat_upper"]) if pd.notna(row["yhat_upper"]) else None,
        )

    # Output: list of predictions with code/date/high/low/close
    # Defensive: ensure unique dates (some downstream consumers assume one row per day).
    out: list[dict[str, Any]] = []
    seen_dates: set[str] = set()
    for _, row in rows_iter:
        ds = pd.to_datetime(row["ds"]).date().isoformat()
        yhat, yhat_lower, yhat_upper = row_to_pred(row)
        if yhat_lower is None:
            yhat_lower = yhat
        if yhat_upper is None:
            yhat_upper = yhat

        if yhat is None:
            continue

        if ds in seen_dates:
            continue
        seen_dates.add(ds)

        out.append(
            {
                "code": code,
                "date": ds,
                "high": yhat_upper,
                "low": yhat_lower,
                "close": yhat,
            }
        )
        logger.info(f"[PREDICTION] code={code}, date={ds}, close={yhat:.2f}, high={yhat_upper:.2f}, low={yhat_lower:.2f}")

    logger.info(f"[FORECAST_DONE] code={code}, predictions_count={len(out)}")
    return out


def get_model_status(code: str) -> dict[str, Any]:
    """Return lightweight diagnostics for a code.

    This is intentionally non-training (no model fit) so it can be used to
    diagnose deployment/config issues (like pointing to the wrong DB).
    """

    code = (code or "").strip()
    if not code:
        raise ValueError("code is required")

    meta = _read_meta(code)
    db_max = _db_max_date(code)

    return {
        "code": code,
        "db_max_date": db_max.isoformat() if db_max else None,
        "model": (
            {
                "trained_until": meta.trained_until.isoformat(),
                "trained_at": meta.trained_at.isoformat(),
                "row_count": meta.row_count,
                "strategy": meta.strategy,
                "validation": meta.validation,
                "residual_std": meta.residual_std,
            }
            if meta
            else None
        ),
    }


def evaluate_code(code: str, points: int = _DEFAULT_BACKTEST_POINTS) -> dict[str, Any]:
    """Evaluate all supported algorithms for a code using a last-N holdout split."""

    code = (code or "").strip()
    if not code:
        raise ValueError("code is required")

    df = _load_series(code)
    if df.empty:
        raise ValueError(f"No historical data found for code={code}")
    if len(df) < (_MIN_TRAIN_ROWS + 2):
        raise ValueError(
            f"Not enough data for evaluation for code={code}. "
            f"Need at least {_MIN_TRAIN_ROWS + 2} rows, got {len(df)}"
        )

    # Backward compatible query param: `points` now means holdout days.
    holdout = max(1, min(int(points), len(df) - _MIN_TRAIN_ROWS))
    validation, selected, _ = _evaluate_algorithms(df, holdout)
    return {
        "code": code,
        "rows": len(df),
        "holdout": holdout,
        "recommended_model": selected,
        "evaluations": validation.get("evaluations", []),
    }
