from __future__ import annotations

import logging
import time
from fastapi import BackgroundTasks, FastAPI, HTTPException, Request

from app.config import settings
from app.db import close_db, init_db
from app.modeling import forecast_next_days, list_codes, schedule_training


app = FastAPI(title=settings.app_name, version=settings.app_version)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.middleware("http")
async def log_requests(request: Request, call_next):
    start_time = time.time()
    
    response = await call_next(request)
    
    process_time = (time.time() - start_time) * 1000
    formatted_process_time = '{0:.2f}'.format(process_time)
    
    logger.info(
        f"Request: {request.method} {request.url.path} | "
        f"Status: {response.status_code} | "
        f"Duration: {formatted_process_time}ms"
    )
    
    return response


@app.on_event("startup")
def _startup() -> None:
    init_db()


@app.on_event("shutdown")
def _shutdown() -> None:
    close_db()


@app.get("/")
def root() -> str:
    return f"{settings.app_name} {settings.app_version}"


@app.get("/sync")
def sync(background_tasks: BackgroundTasks) -> dict:
    """Compatibility endpoint.

    The Java/PHP backends call /sync before looping through /predict/{code}.
    We schedule background model training for all codes, but return immediately.
    """

    try:
        codes = list_codes()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to list codes: {e}")

    for code in codes:
        background_tasks.add_task(schedule_training, code)

    return {"status": "ok", "scheduled": len(codes)}


@app.get("/predict/{code}")
def predict(code: str) -> dict:
    try:
        preds = forecast_next_days(code)
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

    return {"predictions": preds}
