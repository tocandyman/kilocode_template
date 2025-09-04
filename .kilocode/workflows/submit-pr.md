# Submit PR Workflow

You are helping submit a pull request. Follow these steps carefully and stop on errors.

1) search_files for TODO, FIXME, console.log, print( ) used for debug; summarize findings.
2) execute_command to run tests:
   - Poetry: `poetry run pytest -q`
   - Pip: `pytest -q`
3) ask_followup_question (RU): "Как назвать ветку и заголовок PR?" Collect:
   - branch_name, pr_title, pr_body (body optional).
4) execute_command:
   - `git checkout -b {branch_name}` (if branch doesn't exist)
   - Stage & commit all changes with Conventional Commits message using {pr_title}.
   - `git push --set-upstream origin {branch_name}`
5) execute_command:
   - If GitHub CLI available: `gh pr create --title "{pr_title}" --body "{pr_body}"`
   - Else: output manual URL/instructions.
6) Post a concise PR summary and next steps.
