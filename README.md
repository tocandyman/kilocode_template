# Kilocode Python Full‑Stack Template

Zero-to-merge pipeline with roles, gates, and Makefile.

## Quick start

```bash
make install
make run
# in another shell
curl http://localhost:8000/health
```

## CI Gates
- Lint (ruff/black) → Typecheck (mypy) → Security (bandit/pip-audit) → Tests (pytest+coverage≥85) → Contract (schemathesis) → Build (docker+SBOM) → Publish artifacts.

## Performance
- `make perf.smoke` runs a short k6 test (needs k6 installed).
- `make perf.locust` runs a short Locust scenario (needs locust).

## ADRs
- See `docs/adr/` for decisions. Create new ADRs from `_template.md` and bump number.

## KiloCode Memory & Rules
- `.kilocode/global_rules.md` — global constraints for all agents.
- `.kilocode/memory/bank/*.md` — durable facts for agents.
- `.kilocode/agent_rules/*.md` — per-role rulebooks.

**RU/UTF-8**: Документация и пользовательские тексты — по умолчанию поддерживают русский язык; кодировки везде UTF‑8.
