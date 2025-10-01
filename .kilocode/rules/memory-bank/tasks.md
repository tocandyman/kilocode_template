# tasks.md — Повторяемые задачи

## Добавить эндпоинт
1) Обнови `openapi.yaml`.
2) Сгенерируй модели ввода/вывода (pydantic).
3) Реализуй handler без бизнес‑логики (в домене).
4) Покрой тестами (unit + contract).
5) Обнови Memory Bank (context.md).

## Релиз
1) `make test security`
2) `make build sbom`
3) workflow `/release.md`
