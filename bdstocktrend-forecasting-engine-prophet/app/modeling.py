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


_STRATEGIES: tuple[StrategyConfig, ...] = (
    StrategyConfig(
        name="baseline_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.05,
    ),
    StrategyConfig(
        name="conservative_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.01,
    ),
    StrategyConfig(
        name="flexible_additive",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="additive",
        changepoint_prior_scale=0.20,
    ),
    StrategyConfig(
        name="multiplicative",
        yearly_seasonality=True,
        weekly_seasonality=True,
        seasonality_mode="multiplicative",
        changepoint_prior_scale=0.10,
    ),
)

_MIN_TRAIN_ROWS = 45
_DEFAULT_BACKTEST_POINTS = 12
_DEFAULT_HOLDOUT_DAYS = 30


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


def _load_series(code: str) -> pd.DataFrame:
    db = get_db()
    with db.pool.connection() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT date, close FROM historical_stocks_data WHERE code = %s AND close IS NOT NULL ORDER BY date ASC",
                (code,),
            )
            rows = cur.fetchall()

    if not rows:
        return pd.DataFrame(columns=["ds", "y"])

    df = pd.DataFrame(rows, columns=["ds", "y"])
    df["ds"] = pd.to_datetime(df["ds"])
    df["y"] = pd.to_numeric(df["y"], errors="coerce")
    df = df.dropna(subset=["ds", "y"]).sort_values("ds")
    df = df.drop_duplicates(subset=["ds"], keep="last")
    return df


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


def _rank_score(metrics: dict[str, Any]) -> float:
    """Smaller is better. Prioritize RMSE, then MAPE, then PFE."""

    if not metrics or metrics.get("rmse") is None:
        return float("inf")
    rmse = float(metrics.get("rmse") or 0.0)
    mape = float(metrics.get("mape") or 0.0)
    pfe = float(metrics.get("pfe") or 0.0)
    # Weighted score (kept simple and stable across companies)
    return (0.6 * rmse) + (0.3 * mape) + (0.1 * pfe)


def _predict_prophet_on_dates(train_df: pd.DataFrame, future_ds: list[pd.Timestamp], strategy: StrategyConfig) -> list[float]:
    model = _build_prophet(strategy)
    model.fit(train_df[["ds", "y"]])
    pred_df = model.predict(pd.DataFrame({"ds": future_ds}))
    return [float(v) for v in pred_df["yhat"].tolist()]


def _fit_prophet_full(df: pd.DataFrame, strategy: StrategyConfig):
    model = _build_prophet(strategy)
    model.fit(df[["ds", "y"]])
    return model


def _fit_statsmodels_arima(series: pd.Series):
    # Lazy import to keep engine lightweight when users only want Prophet.
    from statsmodels.tsa.arima.model import ARIMA

    # ARIMA order kept conservative for speed and stability.
    return ARIMA(series, order=(1, 1, 1)).fit()


def _fit_statsmodels_arima_drift(series: pd.Series):
    """ARIMA with drift (trend) to avoid overly-flat forecasts when the series trends.

    In statsmodels, for integrated models (d>0), using `trend='t'` acts like a drift term.
    """

    from statsmodels.tsa.arima.model import ARIMA

    return ARIMA(series, order=(1, 1, 1), trend="t").fit()


def _fit_statsmodels_sarimax(series: pd.Series):
    from statsmodels.tsa.statespace.sarimax import SARIMAX

    # Weekly seasonality in BD trading days ~ 5.
    return SARIMAX(
        series,
        order=(1, 1, 1),
        seasonal_order=(0, 0, 0, 0),
        enforce_stationarity=False,
        enforce_invertibility=False,
    ).fit(disp=False)


def _fit_statsmodels_sarimax_weekly(series: pd.Series):
    """SARIMAX with a simple weekly seasonal component (s=5 trading days)."""

    from statsmodels.tsa.statespace.sarimax import SARIMAX

    return SARIMAX(
        series,
        order=(1, 1, 1),
        seasonal_order=(1, 0, 1, 5),
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


def _series_from_df(df: pd.DataFrame) -> pd.Series:
    # Treat trading days as equally spaced steps.
    return pd.Series([float(v) for v in df["y"].tolist()])


def _evaluate_algorithms(df: pd.DataFrame, holdout: int) -> tuple[dict[str, Any], str, float | None]:
    """Evaluate multiple algorithms on last-N holdout; return details + winner."""

    train_df, test_df = _split_holdout(df, holdout)
    if test_df.empty or len(train_df) < _MIN_TRAIN_ROWS:
        # Default: Prophet baseline without validation.
        return (
            {
                "holdout": holdout,
                "selected": "prophet:baseline_additive",
                "evaluations": [],
            },
            "prophet:baseline_additive",
            None,
        )

    future_ds = [pd.to_datetime(v) for v in test_df["ds"].tolist()]
    trues = [float(v) for v in test_df["y"].tolist()]

    evaluations: list[dict[str, Any]] = []

    # --- Prophet strategies ---
    for strategy in _STRATEGIES:
        try:
            preds = _predict_prophet_on_dates(train_df, future_ds, strategy)
            metrics = _eval_metrics(trues, preds)
            evaluations.append(
                {
                    "model": f"prophet:{strategy.name}",
                    "metrics": metrics,
                    "score": round(_rank_score(metrics), 6),
                }
            )
        except Exception as e:
            evaluations.append(
                {
                    "model": f"prophet:{strategy.name}",
                    "metrics": {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None},
                    "score": float("inf"),
                    "error": str(e),
                }
            )

    # --- Classic time series models (close only) ---
    train_series = _series_from_df(train_df)

    def _eval_stats_model(name: str, fit_fn) -> None:
        try:
            fitted = fit_fn(train_series)

            # Prefer forecast with steps.
            forecast = None
            if hasattr(fitted, "get_forecast"):
                forecast = fitted.get_forecast(steps=len(test_df))
                preds = [float(v) for v in forecast.predicted_mean.tolist()]
            elif hasattr(fitted, "forecast"):
                preds = [float(v) for v in fitted.forecast(steps=len(test_df)).tolist()]
            else:
                preds = []

            metrics = _eval_metrics(trues, preds)
            evaluations.append(
                {
                    "model": name,
                    "metrics": metrics,
                    "score": round(_rank_score(metrics), 6),
                }
            )
        except Exception as e:
            evaluations.append(
                {
                    "model": name,
                    "metrics": {"rmse": None, "mape": None, "mae": None, "pfe": None, "residual_std": None},
                    "score": float("inf"),
                    "error": str(e),
                }
            )

    _eval_stats_model("arima(1,1,1)", _fit_statsmodels_arima)
    _eval_stats_model("arima(1,1,1)+drift", _fit_statsmodels_arima_drift)
    _eval_stats_model("sarimax(1,1,1)", _fit_statsmodels_sarimax)
    _eval_stats_model("sarimax(1,1,1)x(1,0,1,5)", _fit_statsmodels_sarimax_weekly)
    _eval_stats_model("ses", _fit_ses)
    _eval_stats_model("hwes", _fit_hwes)

    ranked = sorted(evaluations, key=lambda item: float(item.get("score", float("inf"))))
    winner = ranked[0]["model"] if ranked else "prophet:baseline_additive"
    residual_std = None
    if ranked and isinstance(ranked[0].get("metrics"), dict):
        residual_std = ranked[0]["metrics"].get("residual_std")

    return (
        {
            "holdout": holdout,
            "selected": winner,
            "evaluations": ranked,
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
    df = _load_series(code)
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
            if "x(1,0,1,5)" in selected_model:
                fitted = _fit_statsmodels_sarimax_weekly(series)
            else:
                fitted = _fit_statsmodels_sarimax(series)
        elif selected_model == "ses":
            fitted = _fit_ses(series)
        elif selected_model == "hwes":
            fitted = _fit_hwes(series)
        else:
            # Fallback to Prophet if something unexpected happens.
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

        if hasattr(sm_model, "get_forecast"):
            fc = sm_model.get_forecast(steps=steps)
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
            yhat = [float(v) for v in sm_model.forecast(steps=steps).tolist()]
        else:
            yhat = []

        residual_std = float(meta.residual_std) if (meta and meta.residual_std is not None) else 0.0
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
