# Secure-Pipeline

This project is a hands-on DevSecOps portfolio project focused on securing the software delivery lifecycle for a small containerized internal service.

## Current Status

Phase 1: Local FastAPI service

Phase 2: Containerized FastAPI service

## Service Endpoints

GET /health

GET /metadata

## Planned Security Work

- CI/CD security gates
- Secret scanning
- Dependency scanning
- Container image scanning
- SBOM generation
- Dockerfile hardening
- Pipeline permissions hardening

## Run with Docker

This project can be built and run as a Docker container.

### Build the image
```
docker build -t <container_name> .
```

### Run the Container
```
docker run -p 8000:8000 <container_name>
```

### Verify it is working
```
http://localhost:8000/health
``` 

```
curl http://localhost:8000/health
```

```
curl http://localhost:8000/metadata
```

## Containerization Notes

The service is containerized using a Python slim base image.

The container exposes port 8000 and runs the FastAPI service with Uvicorn.

Uvicorn is configured with `--host 0.0.0.0` so the service is reachable from outside the container when Docker port mapping is used.

The project uses `.dockerignore` to keep unnecessary local files out of the Docker build context.


## Run Tests

This project includes small automated tests to validate the FastAPI service behavior.

The tests currently verify:

- The health endpoint responds successfully
- The metadata endpoint responds successfully
- The root endpoint redirects to the health endpoint

Run the test suite from the project root:

```bash
pytest