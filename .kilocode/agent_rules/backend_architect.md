# Agent Rules — Backend Architect

- Enforce layered structure: `app/api`, `app/domain`, `app/infra`, `app/tests`.
- No business logic in handlers; inject services via Depends/DI.
- All endpoints must have pydantic request/response models and examples.
- Provide health/readiness endpoints; wire Prometheus metrics and basic OTEL.
