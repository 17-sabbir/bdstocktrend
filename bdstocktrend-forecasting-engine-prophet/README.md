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

## Deploy (cPanel shared hosting)

If you upload this project as a normal folder under `public_html/`, you will likely see `403 Forbidden` because LiteSpeed/Apache will treat it as a static directory (no `index.html/index.php`) and the FastAPI app will not run.

Use cPanel **Setup Python App** (Passenger) instead:

1) cPanel → **Setup Python App** → **Create Application**
2) Choose a Python version available on your hosting
3) Set **Application root** to the uploaded project folder
4) Set **Application startup file** to `passenger_wsgi.py`
5) Set **Application entry point** to `application`
6) Set the app URL (recommended: a subdomain like `engine.yourdomain.com` or a path like `/forecasting-engine-prophet`)
7) Add environment variables in the cPanel UI (recommended) or ensure the `.env` file exists in the application root:
  - `DATABASE_URL` (preferred) or `DB_HOST/DB_PORT/DB_NAME/DB_USER/DB_PASSWORD`
  - `FORECAST_DAYS`, `INTERVAL_WIDTH`, `MODEL_DIR`, `SYNC_MAX_WORKERS`

This repo includes `passenger_wsgi.py` which wraps the FastAPI (ASGI) app into a WSGI callable for Passenger.
