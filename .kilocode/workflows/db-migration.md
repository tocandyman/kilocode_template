# DB Migration Workflow (Alembic)

1) ask_followup_question (RU): "Описание изменения схемы? (какие таблицы/поля меняются)"
2) execute_command: `alembic revision -m "{message}" --autogenerate`
3) Review generated migration with search_files for `op.` operations; call out risky ops.
4) execute_command: `alembic upgrade head` (confirm with user before applying).
