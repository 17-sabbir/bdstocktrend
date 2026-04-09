from __future__ import annotations

import logging
import os
from pathlib import Path

from pydantic import AliasChoices, Field
from pydantic_settings import BaseSettings, SettingsConfigDict

logger = logging.getLogger(__name__)

# Try to get project root from environment (set by passenger_wsgi.py)
# Fall back to path resolution if not set.
if "APP_ROOT" in os.environ:
    _PROJECT_ROOT = Path(os.environ["APP_ROOT"])
    logger.info(f"Using APP_ROOT from environment: {_PROJECT_ROOT}")
else:
    _PROJECT_ROOT = Path(__file__).resolve().parents[1]
    logger.info(f"Using fallback project root: {_PROJECT_ROOT}")

_ENV_FILE = _PROJECT_ROOT / ".env"
logger.info(f"Looking for .env file at: {_ENV_FILE}")
logger.info(f".env file exists: {_ENV_FILE.exists()}")


class Settings(BaseSettings):
    # Use an absolute path so `.env` loads reliably under Passenger/cPanel,
    # where the working directory may not be the project root.
    model_config = SettingsConfigDict(
        env_file=str(_ENV_FILE),
        extra="ignore",
        # Avoid warnings for fields like `model_dir` that start with "model_".
        protected_namespaces=("settings_",),
    )

    # Server
    app_name: str = "bdstocktrend-prophet-engine"
    app_version: str = "0.1.0"

    # DB (prefer DATABASE_URL)
    database_url: str | None = Field(default=None, validation_alias="DATABASE_URL")
    db_host: str | None = Field(default=None, validation_alias="DB_HOST")
    db_port: int = Field(default=5432, validation_alias="DB_PORT")
    db_name: str | None = Field(
        default=None,
        validation_alias=AliasChoices("DB_NAME", "DB_DATABASE"),
    )
    db_user: str | None = Field(
        default=None,
        validation_alias=AliasChoices("DB_USER", "DB_USERNAME"),
    )
    db_password: str | None = Field(default=None, validation_alias="DB_PASSWORD")

    # Forecast
    forecast_days: int = Field(default=30, validation_alias="FORECAST_DAYS")
    interval_width: float = Field(default=0.8, validation_alias="INTERVAL_WIDTH")

    # Model/cache
    model_dir: str = Field(default="data/models", validation_alias="MODEL_DIR")
    sync_max_workers: int = Field(default=4, validation_alias="SYNC_MAX_WORKERS")


settings = Settings()
