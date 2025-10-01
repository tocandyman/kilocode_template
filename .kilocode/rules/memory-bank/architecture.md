# architecture.md — Архитектура

- Слои: `app/api` (маршруты), `app/domain` (бизнес‑логика), `app/infra` (БД/адаптеры).
- Контракт: `openapi.yaml` — источник истины.
- БД: PostgreSQL 16, миграции Alembic, транзакции явные.
- Наблюдаемость: Prometheus, структурные логи, OTEL (задача к интеграции).

- MCP integration: servers defined in `.kilocode/mcp.json`; optional servers in `.kilocode/mcp.optional.json`. Apply least privilege; document changes in Memory Bank.
