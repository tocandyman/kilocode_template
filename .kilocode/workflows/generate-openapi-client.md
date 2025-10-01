# generate-openapi-client.md — Generate API Client

Generate typed clients from openapi.yaml for Python and TypeScript.

## Steps
1) read_file(): `openapi.yaml` to ensure validity.
2) execute_command(): `which openapi-generator-cli || echo "Install openapi-generator-cli if missing"`
3) execute_command(): `openapi-generator-cli validate -i openapi.yaml || exit 0`
4) If valid, generate Python client into `clients/python/` and TS into `clients/ts/`:
   - `openapi-generator-cli generate -i openapi.yaml -g python -o clients/python --skip-validate-spec`
   - `openapi-generator-cli generate -i openapi.yaml -g typescript-axios -o clients/ts --skip-validate-spec`
5) Create README stubs for clients and link from main README.
