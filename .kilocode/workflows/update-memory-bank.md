# update-memory-bank.md — Update Memory Bank

Keep Memory Bank synchronized with current code state.

## Steps
1) read_file(): `.kilocode/rules/memory-bank/brief.md` and `context.md`.
2) search_files(): scan for architectural changes (routers, schemas, migrations).
3) Summarize: current work focus, last changes, next steps.
4) edit files in `.kilocode/rules/memory-bank/`: update `context.md`, `architecture.md`, and `tasks.md` where appropriate.
5) Include references to changed files and PRs.
6) End by confirming: "[Memory Bank: Active] Updated context and architecture."

## Notes
- Keep files concise; prefer links to detailed docs.
