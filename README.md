# Secure CI/CD Pipeline

A small FastAPI app with a GitHub Actions pipeline focused on basic DevSecOps controls: testing, dependency scanning, secret scanning, container scanning, SBOM generation, and container hardening.

## What This Shows

This project demonstrates how to secure a simple application delivery pipeline without overcomplicating it. The pipeline checks that the app works, scans for common security issues, builds a Docker image, validates the container does not run as root, and limits GitHub Actions permissions.

## Security Controls

| Area | Tool / Control |
|---|---|
| Unit testing | pytest |
| Python dependency scanning | pip-audit |
| Secret scanning | Gitleaks |
| Container vulnerability scanning | Trivy |
| SBOM generation | Syft |
| Container hardening | non-root container user |
| CI permissions | read-only `contents` permission |

## Local Usage

Create and activate a virtual environment:

```bash
python -m venv venv
source venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the app:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

Run tests:

```bash
pytest
```

## Docker Usage

Build the image:

```bash
docker build -t secure-pipeline .
```

Run the container:

```bash
docker run -p 8000:8000 secure-pipeline
```

Check the health endpoint:

```bash
curl http://localhost:8000/health
```

## Why This Project Matters

The goal of this project was not to build a complex app. The goal was to build a simple app and wrap it in a security-focused delivery pipeline.

It shows practical experience with CI/CD security, container security, software supply chain basics, and security automation.
