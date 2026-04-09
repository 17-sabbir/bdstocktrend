from __future__ import annotations

import logging
from dataclasses import dataclass
from urllib.parse import urlsplit, urlunsplit

from psycopg_pool import ConnectionPool

from app.config import settings


logger = logging.getLogger(__name__)


def _redact_conninfo(conninfo: str) -> str:
    """Redact secrets in conninfo/DSN for safe logging."""
    if not conninfo:
        return conninfo

    # URI style: postgresql://user:pass@host/db
    if "://" in conninfo:
        try:
            parts = urlsplit(conninfo)
            if parts.password is None:
                return conninfo
            netloc = parts.hostname or ""
            if parts.username:
                netloc = f"{parts.username}:***@{netloc}"
            if parts.port:
                netloc = f"{netloc}:{parts.port}"
            return urlunsplit((parts.scheme, netloc, parts.path, parts.query, parts.fragment))
        except Exception:
            # Fall back to basic redaction below.
            pass

    # key=value style: password=...
    tokens = conninfo.split()
    out: list[str] = []
    for t in tokens:
        if t.startswith("password="):
            out.append("password=***")
        else:
            out.append(t)
    return " ".join(out)


class UnavailablePool:
    def __init__(self, reason: str):
        self._reason = reason

    def connection(self, *args, **kwargs):  # pragma: no cover
        raise RuntimeError(f"Database is not available: {self._reason}")

    def close(self) -> None:
        return


def _escape_conninfo_value(value: str) -> str:
    """Escape a value for libpq conninfo format (key=value pairs)."""
    if not value:
        return ""
    # In libpq conninfo, single quotes and backslashes need escaping
    value = value.replace("\\", "\\\\").replace("'", "\\'")
    # If value contains spaces or special chars, wrap in quotes
    if any(c in value for c in (" ", "=", "'", "\\")):
        return f"'{value}'"
    return value


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

    # Build libpq conninfo string (key=value pairs)
    # This handles special characters in passwords correctly
    return " ".join([
        f"host={_escape_conninfo_value(settings.db_host)}",
        f"port={settings.db_port}",
        f"dbname={_escape_conninfo_value(settings.db_name)}",
        f"user={_escape_conninfo_value(settings.db_user)}",
        f"password={_escape_conninfo_value(settings.db_password)}",
    ])


@dataclass
class Db:
    pool: ConnectionPool | UnavailablePool


_db: Db | None = None


def init_db() -> Db:
    global _db
    if _db is not None:
        logger.info("Database already initialized, returning cached connection")
        return _db

    pool: ConnectionPool | None = None
    try:
        logger.info("=" * 60)
        logger.info("Starting database initialization...")
        logger.info("=" * 60)
        
        conninfo = _build_database_url()
        if settings.database_url:
            logger.info("Using DATABASE_URL for DB connection")
        else:
            logger.info(
                "Using DB_HOST/DB_PORT/DB_NAME for DB connection: %s:%s/%s",
                settings.db_host,
                settings.db_port,
                settings.db_name,
            )
        logger.debug("DB conninfo (redacted): %s", _redact_conninfo(conninfo))
        
        logger.info("Creating ConnectionPool...")
        pool = ConnectionPool(conninfo=conninfo, min_size=0, max_size=10, timeout=30)
        logger.info("ConnectionPool object created")
        
        # Don't test connection immediately - just create the pool
        # This allows the app to start even if DB is temporarily down
        logger.info("Database pool initialized successfully")
        logger.info("(Note: Connection will be tested on first use)")
        
        _db = Db(pool=pool)
        logger.info("=" * 60)
        logger.info("DATABASE INITIALIZATION COMPLETE")
        logger.info("=" * 60)
        return _db
        
    except Exception as e:
        logger.exception("ERROR during database initialization")
        if pool is not None:
            try:
                pool.close()
                logger.info("Closed failed connection pool")
            except Exception:
                logger.exception("Error closing failed pool")
        
        # Don't re-raise - let app start anyway
        logger.warning("App will start but database is NOT available")
        _db = Db(pool=UnavailablePool(str(e)))
        return _db


def get_db() -> Db:
    if _db is None:
        return init_db()
    return _db


def close_db() -> None:
    global _db
    if _db is None:
        return
    try:
        _db.pool.close()
    except Exception:
        logger.exception("Error closing database pool")
    _db = None
