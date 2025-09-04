# Code Review Prep Workflow

1) search_files for: TODO, FIXME, debug prints, large functions (>200 LOC), missing docstrings.
2) execute_command to run linters and formatters in check mode.
3) execute_command to run tests with coverage if configured (Poetry: `poetry run pytest`; Pip: `pytest`).
4) Summarize findings into a PR description template and suggest Conventional Commit messages.
