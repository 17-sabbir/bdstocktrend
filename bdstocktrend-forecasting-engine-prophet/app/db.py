from __future__ import annotations

from dataclasses import dataclass

from psycopg_pool import ConnectionPool

from app.config import settings


def _build_database_url() -> str:
    if settings.database_url:
        return settings.database_url

    missing = [
        name
        for name, value in {
            "DB_HOST": settings.db_host,
            "DB_NAME": settings.db_name,
            "DB_USER": settings.db_user,
            "DB_PASSWORD": settings.db_password,
        }.items()
        if not value
    ]
    if missing:
        raise RuntimeError(
            "Database not configured. Provide DATABASE_URL or set: " + ", ".join(missing)
        )

    # psycopg accepts standard libpq connection string as well.
    return (
        f"postgresql://{settings.db_user}:{settings.db_password}"
        f"@{settings.db_host}:{settings.db_port}/{settings.db_name}"
    )


@dataclass
class Db:
    pool: ConnectionPool


_db: Db | None = None


def init_db() -> Db:
    global _db
    if _db is not None:
        return _db

    conninfo = _build_database_url()
    pool = ConnectionPool(conninfo=conninfo, min_size=1, max_size=10, timeout=30)
    _db = Db(pool=pool)
    return _db


def get_db() -> Db:
    if _db is None:
        return init_db()
    return _db


def close_db() -> None:
    global _db
    if _db is None:
        return
    _db.pool.close()
    _db = None
