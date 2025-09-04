# Release Workflow

Automate SemVer bump, changelog, tagging, and zipping source into versions/.

1) ask_followup_question (RU): "Релизный номер? (major/minor/patch или явный semver)"
2) Determine next version; update version file(s) if present (pyproject.toml, package.json, etc.).
3) Generate release notes from last tag using git log; append to CHANGELOG.md under new heading.
4) execute_command:
   - Create git tag `v{version}` and push tags.
   - Zip source (excluding caches) to `versions/<project>_v{version}_<YYYYMMDD>.zip`.
5) Output release artifact path and summary.
