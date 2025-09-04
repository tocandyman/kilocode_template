# Docs Refresh Workflow

1) search_files for README.md and docs/*.md; ensure Mermaid blocks render (basic syntax check).
2) Update diagrams if flows changed (pull from docs/diagrams/*.mmd if present).
3) Generate/refresh API docs stubs from code docstrings if tool available (pdoc, Sphinx).
4) Summarize diff and open a docs PR.
