# Secure-Pipeline

This project is a hands-on DevSecOps portfolio project focused on securing the software delivery lifecycle for a small containerized internal service.

## Current Status

Phase 1: Local FastAPI service

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