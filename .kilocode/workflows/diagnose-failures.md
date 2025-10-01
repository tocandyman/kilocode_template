# diagnose-failures.md — Diagnose CI Failures

## Steps
1) new_task(): "Investigate CI failures"
2) read_file(): `.github/workflows/ci.yml` and recent run logs (if accessible).
3) If lint/typecheck failed — run `make lint`/`make typecheck` and capture outputs.
4) If tests failed — run `make test`; open `artifacts/pytest_report.xml` and summarize top failures.
5) If coverage below threshold — point to weakest packages; suggest test targets.
6) If security scan failed — parse `artifacts/bandit.json`/`pip-audit.json` and suggest fixes.
7) If Docker build failed — open `artifacts/docker_build.log` and identify the failing layer.
8) Propose a minimal PR diff to fix issues.

## Required artifacts
- pytest_report.xml, coverage.html, bandit.json, pip-audit.json, docker_build.log
