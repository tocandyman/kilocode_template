# Test and Coverage Workflow

1) Detect coverage tool (coverage.py, pytest-cov).
2) execute_command: run tests with coverage; fail threshold configurable (default 80%).
   - Poetry: `poetry run pytest --cov -q`
   - Pip: `pytest --cov -q`
3) Generate a short HTML/text report and list slowest tests.
4) Suggest focused refactors for hot spots.
