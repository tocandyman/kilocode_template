# Versioning & Release

- Use **SemVer** (`MAJOR.MINOR.PATCH`).
- On release:
  1) Update `CHANGELOG.md` (Added/Changed/Fixed).
  2) Update `README.md` if needed.
  3) Zip the source and store in `versions/`:
     - Name: `<project>_v<semver>_<YYYYMMDD>.zip`
     - Contents: sources only, no caches/build artifacts.
  4) Optionally create a Git tag `v<semver>`.
