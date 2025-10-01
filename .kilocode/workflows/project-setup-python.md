# project-setup-python.md — Project Bootstrap (Python)

## Steps
1) new_task(): "Initialize Python backend project setup"
2) execute_command(): `make install`
3) execute_command(): `docker compose up -d db`
4) execute_command(): `make db.migrate`
5) execute_command(): `make run`
6) Verify health: use http client to GET `/health` (httpx/curl).

## Outputs
- Running service at http://localhost:8000
- DB initialized, alembic head applied
