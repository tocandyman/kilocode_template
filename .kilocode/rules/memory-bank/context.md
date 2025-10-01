# context.md — Текущий контекст

- Базовый шаблон поднят, CI и гейты включены.
- Следующие шаги: определить бизнес‑эндпоинты `/v1/...`, добавить e2e и генерацию SDK.
- Порог p95: 300ms для базовых GET; измерения крутятся в `make perf.*`.

- MCP tools enabled: `context7`, `filesystem` (read-only /opt/*), `time`. See `.kilocode/mcp/README.md`.
