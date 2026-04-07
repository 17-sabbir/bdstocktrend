# BDStockTrend Prophet Forecasting Engine

A drop-in replacement forecasting engine for BDStockTrend that is compatible with the existing backend engine contract.

## Endpoints (contract)

- `GET /` -> returns a version string
- `GET /sync` -> schedules background training and returns `200`
- `GET /predict/{code}` -> returns:

```json
{
  "predictions": [
    {"code": "ABC", "date": "2026-04-05", "high": 123.0, "low": 110.0, "close": 118.0}
  ]
}
```

## Configuration

Prefer `DATABASE_URL`, otherwise use the individual `DB_*` variables.

- `DATABASE_URL` (optional)
- `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`
- `FORECAST_DAYS` (default `30`)
- `INTERVAL_WIDTH` (default `0.8`)
- `MODEL_DIR` (default `data/models`)
- `SYNC_MAX_WORKERS` (default `4`)

See `.env.example`.

## Run (Docker)

```bash
docker build -t bdstocktrend-prophet-engine .
docker run --rm -p 8585:8585 --env-file .env bdstocktrend-prophet-engine
```

Point your PHP backend `.env` to:

```dotenv
ENGINE_URL=http://localhost:8585
```

Notes:
- This engine reads from `historical_stocks_data` and returns forecasts; it does not modify your DB schema.
- Your PHP backend will continue writing the engine results into `prediction_data`.
