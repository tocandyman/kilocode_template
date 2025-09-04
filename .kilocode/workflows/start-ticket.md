# Start Ticket Workflow

Goal: prepare a feature branch and skeleton commits for a new ticket.

1) ask_followup_question (RU): "ID задачи (например, ABC-123) и краткое описание?"
2) Normalize: branch = `feat/{ticket_id}-{kebab_title}`.
3) execute_command: `git checkout -b {branch}`.
4) Create placeholder files if mentioned by user; add checklist in TODO.md.
5) Commit: `feat({ticket_id}): bootstrap task scaffold`.
6) Output branch name and next actions (open editor, run tests).
