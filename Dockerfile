FROM python:3.12-slim

WORKDIR /secure-pipeline

COPY requirements.txt /secure-pipeline

RUN pip install -r requirements.txt

COPY /app /secure-pipeline

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
