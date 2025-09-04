# Sync Fork Workflow

1) Ensure `upstream` remote exists (ask to add if missing).
2) execute_command:
   - `git fetch upstream`
   - `git checkout main`
   - `git rebase upstream/main` (or `merge` if policy forbids rebase)
3) Push updated main to origin.
