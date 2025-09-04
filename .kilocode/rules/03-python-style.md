# Python Style & Quality

- Enforce **PEP 8**.
- Before commit: run **black**, **isort**, **pylint** (no errors). If types are used — **mypy**.
- Tests: **pytest**; target coverage ≥ **80%** (configurable per project).
- No `print` in production code — use **logging**.
