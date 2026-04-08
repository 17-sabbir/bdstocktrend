from __future__ import annotations

from pydantic import AliasChoices, Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

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
