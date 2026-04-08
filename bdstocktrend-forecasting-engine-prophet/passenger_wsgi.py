from __future__ import annotations

import os
import sys

from asgi2wsgi import ASGI2WSGI


# Ensure project root is on sys.path so `from app...` imports work.
PROJECT_ROOT = os.path.dirname(__file__)
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)


# cPanel "Setup Python App" uses Passenger, which expects a WSGI callable named
# `application`. FastAPI is ASGI, so we wrap it.
from app.main import app as asgi_app  # noqa: E402

application = ASGI2WSGI(asgi_app)
