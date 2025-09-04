# Project Setup Workflow

1) Detect environment:
   - Python with Poetry if `pyproject.toml` and `poetry.lock` exist.
   - Otherwise Python with pip if `requirements*.txt` exist.
2) execute_command:
   - Poetry: `python -m pip install --upgrade pip` then `pip install poetry` (if missing), then `poetry install`
   - Pip: create venv (if needed) and `pip install -r requirements.txt -r requirements-dev.txt` (if they exist)
3) Initialize git hooks: `pre-commit install` if config exists.
4) Quick checks (best effort):
   - `black --check .`
   - `isort --check-only .`
   - `pylint $(git ls-files '*.py') || true`
   - Poetry: `poetry run pytest -q || true`
   - Pip: `pytest -q || true`
5) Print a short report with actionable next steps.
