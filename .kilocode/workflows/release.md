# release.md — Cut a Release

Create a release using Conventional Commits and SemVer policy.

## Steps
1) read_file(): `.kilocode/global_rules.md` and confirm SemVer policy.
2) execute_command(): `git fetch --all --tags`.
3) execute_command(): generate changelog with conventional commits (cz or git-cliff if available). If not, synthesize from `git log --pretty`.
4) Bump version in `pyproject.toml` (patch by default), commit `chore(release): vX.Y.Z`.
5) execute_command(): `git tag -s vX.Y.Z -m "Release vX.Y.Z"` (if GPG available, else unsigned).
6) execute_command(): `git push --follow-tags`.
7) execute_command(): `make build` then optional `make sbom`.
8) Post-release: create draft GitHub Release using `gh release create vX.Y.Z --generate-notes`.

## Gates
- Tests green, coverage ≥ 85%
- Security reports attached (bandit, pip-audit)
- SBOM present if syft available
