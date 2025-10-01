FROM python:3.11-slim AS base
ENV POETRY_VERSION=1.8.3 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONUNBUFFERED=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=true
RUN apt-get update && apt-get install -y --no-install-recommends build-essential curl git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir poetry==${POETRY_VERSION}
WORKDIR /app

COPY pyproject.toml README.md ./
RUN poetry install --no-root --no-interaction --no-ansi

FROM base AS runtime
COPY app ./app
COPY openapi.yaml ./openapi.yaml
CMD ["poetry","run","uvicorn","app.api.main:app","--host","0.0.0.0","--port","8000"]
