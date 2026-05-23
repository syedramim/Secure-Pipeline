from fastapi import FastAPI
from fastapi.responses import RedirectResponse

app = FastAPI(
    title="Service Health API",
    description="API for checking the health of the service.",
    version="0.0.1",
)

@app.get("/")
def base_page():
    """
    Base endpoint to redirect to health check endpoint.
    """
    return RedirectResponse(url="/health")

@app.get("/health")
def health_check():
    """
    Endpoint to check the health of the service.
    Returns a simple message indicating that the service is healthy.
    """
    return {
        "status": "not healthy",
        "service": "Service Health API"
    }

@app.get("/metadata")
def metadata():
    """
    Endpoint to get metadata about the service.
    Returns information about the service.
    """
    return {
        "service": "Service Health API",
        "environment": "local",
        "version": "0.0.1"
    }

