# submit-pr.md — Submit Pull Request

You are submitting a pull request from the current branch.
Follow these steps exactly. Ask for missing parameters if needed.

## Inputs (ask if missing)
- branch_name
- reviewers (comma-separated)
- pr_title
- pr_body

## Steps
1) search_files(): scan repo for TODO/FIXME, `print()`/`console.log` in tracked files; summarize findings.
2) execute_command(): run `make precommit` then `make test` and collect artifacts: `artifacts/pytest_report.xml`, `artifacts/coverage_html`.
3) If tests pass, execute_command(): `git add -A && git commit -m "{pr_title}" || true`.
4) execute_command(): `git push -u origin {branch_name}`.
5) execute_command(): `gh pr create --fill --title "{pr_title}" --body "{pr_body}" --reviewer {reviewers}`.
6) ask_followup_question(): "Confirm PR link and next steps (assign labels/milestone)?"
7) If requested, execute_command(): `gh pr edit --add-label "ready-for-review"`.

## Artifacts required
- pytest_report.xml
- coverage.xml/html

