# Use Poetry if available; fallback to pip
PY ?= python3
POETRY := $(shell command -v poetry 2>/dev/null)
PIP := $(if $(POETRY),poetry run pip,pip)
RUN := $(if $(POETRY),poetry run,)
UVICORN := $(RUN) uvicorn

.PHONY: help install venv precommit lint format typecheck test coverage security contract build run down db.migrate db.revise openapi.gen docs sbom

help:
	@echo "Targets:"
	@echo "  install       - install deps (poetry or pip) & pre-commit"
	@echo "  lint          - ruff (lint)"
	@echo "  format        - black + ruff format"
	@echo "  typecheck     - mypy"
	@echo "  test          - pytest with coverage"
	@echo "  security      - bandit + pip-audit (or safety)"
	@echo "  contract      - schemathesis against openapi.yaml (server must be running)"
	@echo "  build         - docker build with logs"
	@echo "  run           - docker-compose up app & db"
	@echo "  down          - docker-compose down"
	@echo "  db.migrate    - alembic upgrade head"
	@echo "  db.revise     - alembic revision --autogenerate -m 'msg'"
	@echo "  openapi.gen   - regenerate client stubs (placeholder)"
	@echo "  docs          - placeholder for docs build"
	@echo "  sbom          - syft SBOM (if installed)"
	@echo "  precommit     - install pre-commit hooks"

venv:
	@if [ -n "$(POETRY)" ]; then poetry install --no-root; else $(PY) -m venv .venv && . .venv/bin/activate && pip install -U pip; fi

install: venv
	@if [ -z "$(POETRY)" ]; then . .venv/bin/activate && pip install -e '.[dev]'; else poetry install; fi
	@$(RUN) pre-commit install -t pre-commit -t commit-msg

precommit:
	@$(RUN) pre-commit run --all-files || true

lint:
	@$(RUN) ruff check .

format:
	@$(RUN) black . && $(RUN) ruff format .

typecheck:
	@$(RUN) mypy app

test:
	@mkdir -p artifacts
	@$(RUN) pytest

coverage:
	@echo "Coverage report at artifacts/coverage_html/index.html"

security:
	@$(RUN) bandit -r app -f json -o artifacts/bandit.json || true
	@$(RUN) pip-audit -r pyproject.toml -f json -o artifacts/pip-audit.json || true

contract:
	@$(RUN) schemathesis run openapi.yaml --base-url=http://localhost:8000 || true

build:
	docker build -t kilocode/app:dev . | tee artifacts/docker_build.log

run:
	docker compose up -d

down:
	docker compose down

db.migrate:
	@$(RUN) alembic upgrade head

db.revise:
	@$(RUN) alembic revision --autogenerate -m "update"

openapi.gen:
	@echo "Generate client code from openapi.yaml (hook your generator here)"

docs:
	@echo "Build docs (add Sphinx/MkDocs commands here)"

sbom:
	@which syft >/dev/null 2>&1 && syft packages dir:. -o spdx-json > artifacts/sbom.spdx.json || echo "syft not installed"

perf.smoke:
	@which k6 >/dev/null 2>&1 || (echo "Install k6 to run smoke test" && exit 0)
	BASE_URL=http://localhost:8000 k6 run scripts/k6_smoke.js

perf.locust:
	@which locust >/dev/null 2>&1 || (echo "Install locust to run perf tests" && exit 0)
	locust -f scripts/locustfile.py --headless -u 5 -r 2 -t 30s --host http://localhost:8000
