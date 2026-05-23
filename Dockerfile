FROM python:3.12-slim

WORKDIR /secure-pipeline

COPY requirements.txt /secure-pipeline

RUN pip install -r requirements.txt

RUN groupadd --gid 1001 sec_group && \
    useradd --uid 1001 --gid sec_group --no-create-home --shell /bin/false sec_user

COPY /app /secure-pipeline

RUN chown -R sec_user:sec_group /secure-pipeline

# USER sec_user

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
