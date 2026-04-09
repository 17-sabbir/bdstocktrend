from __future__ import annotations

import logging
import os
import sys
import time
import traceback
import threading
from datetime import datetime


def _configure_logging(project_root: str) -> str:
    """Configure logging early so import/startup errors are captured."""
    log_dir = os.path.join(project_root, "logs")
    log_file = os.path.join(log_dir, "passenger_startup.log")

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.INFO)

    formatter = logging.Formatter("%(asctime)s [%(levelname)s] %(name)s: %(message)s")

    # Always ensure stderr handler exists (Passenger often captures this).
    if not any(isinstance(h, logging.StreamHandler) and getattr(h, "stream", None) is sys.stderr for h in root_logger.handlers):
        err_handler = logging.StreamHandler(sys.stderr)
        err_handler.setLevel(logging.INFO)
        err_handler.setFormatter(formatter)
        root_logger.addHandler(err_handler)

    # Try to log to a file, but don't fail startup if the filesystem is read-only.
    try:
        os.makedirs(log_dir, exist_ok=True)
        if not any(isinstance(h, logging.FileHandler) and getattr(h, "baseFilename", "") == os.path.abspath(log_file) for h in root_logger.handlers):
            file_handler = logging.FileHandler(log_file)
            file_handler.setLevel(logging.INFO)
            file_handler.setFormatter(formatter)
            root_logger.addHandler(file_handler)
    except Exception:
        # We'll still have stderr logging.
        log_file = "(file logging unavailable)"

    logging.info("passenger_wsgi.py loaded")
    logging.info("python=%s", sys.version.replace("\n", " "))
    logging.info("cwd=%s", os.getcwd())
    logging.info("project_root=%s", project_root)
    logging.info("log_file=%s", log_file)
    return log_file


def _make_error_wsgi_app(message: str) -> callable:
    def error_app(environ, start_response):
        body = (
            "Application startup failed.\n\n"
            f"{message}\n\n"
            f"time={datetime.utcnow().isoformat()}Z\n"
        ).encode("utf-8")
        start_response(
            "500 Internal Server Error",
            [("Content-Type", "text/plain; charset=utf-8"), ("Content-Length", str(len(body)))],
        )
        return [body]

    return error_app


def _make_plain_text_response(status: str, text: str) -> callable:
    body = text.encode("utf-8")

    def app(environ, start_response):
        start_response(
            status,
            [("Content-Type", "text/plain; charset=utf-8"), ("Content-Length", str(len(body)))],
        )
        return [body]

    return app


def _wrap_wsgi_debug(wsgi_app: callable) -> callable:
    """WSGI wrapper to log each request before entering the ASGI bridge."""

    def wrapped(environ, start_response):
        started = time.monotonic()
        status_holder: dict[str, str] = {}

        def _start_response(status, headers, exc_info=None):
            status_holder["status"] = status
            return start_response(status, headers, exc_info)

        try:
            method = environ.get("REQUEST_METHOD", "?")
            path = environ.get("PATH_INFO", "")
            qs = environ.get("QUERY_STRING", "")
            logging.info("WSGI_REQUEST %s %s%s", method, path, ("?" + qs) if qs else "")

            # Optional: if ASGI bridge hangs and you need to prove Passenger routing works,
            # enable a minimal /health response by setting PASSENGER_HEALTH_FALLBACK=1.
            if os.environ.get("PASSENGER_HEALTH_FALLBACK") == "1":
                if path == "/health" and environ.get("REQUEST_METHOD") in ("GET", "HEAD"):
                    return _make_plain_text_response(
                        "200 OK",
                        "ok\n",
                    )(environ, start_response)

        except Exception:
            logging.exception("WSGI debug wrapper error")

        try:
            return wsgi_app(environ, _start_response)
        finally:
            dur_ms = (time.monotonic() - started) * 1000.0
            logging.info(
                "WSGI_RESPONSE %s %s in %.1fms",
                status_holder.get("status", "(no status)"),
                environ.get("PATH_INFO", ""),
                dur_ms,
            )

    return wrapped


# Passenger looks for a module-global WSGI callable named `application`.
# NOTE: Under Passenger, the app may be imported in a preloader process and then
# forked. Creating background threads (like a2wsgi's event loop thread) at import
# time can deadlock in the forked worker. Therefore we lazy-initialize the
# ASGI->WSGI bridge on the first request inside the worker process.

_wsgi_app: callable | None = None
_wsgi_app_lock = threading.Lock()

PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))

# Ensure imports work even if Passenger starts in a different working directory.
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

# Let the app resolve `.env` reliably (used by app/config.py).
os.environ.setdefault("APP_ROOT", PROJECT_ROOT)

LOG_FILE = _configure_logging(PROJECT_ROOT)

try:
    logging.info("Importing ASGI app (FastAPI) from app.main...")
    from app.main import app as asgi_app

    logging.info("ASGI app imported. Will initialize ASGI->WSGI bridge lazily")

except Exception:
    tb = traceback.format_exc()
    logging.error("Startup exception occurred")
    logging.error(tb)

    def application(environ, start_response):
        return _make_error_wsgi_app(f"Check {LOG_FILE} for details.\n\n{tb}")(
            environ, start_response
        )

else:

    def _get_wsgi_app() -> callable:
        global _wsgi_app
        if _wsgi_app is not None:
            return _wsgi_app

        with _wsgi_app_lock:
            if _wsgi_app is not None:
                return _wsgi_app

            logging.info(
                "Initializing a2wsgi.ASGIMiddleware in pid=%s (post-fork safe)",
                os.getpid(),
            )
            from a2wsgi import ASGIMiddleware

            wait_time_env = os.environ.get("A2WSGI_WAIT_TIME")
            wait_time = float(wait_time_env) if wait_time_env else None
            wsgi = ASGIMiddleware(asgi_app, wait_time=wait_time)
            wsgi = _wrap_wsgi_debug(wsgi)
            _wsgi_app = wsgi
            logging.info("WSGI application is ready")
            return _wsgi_app


    def application(environ, start_response):
        return _get_wsgi_app()(environ, start_response)


# Some setups look for `app` as well.
app = application