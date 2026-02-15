@echo off
REM Register custom search attributes so they appear in Temporal UI workflow table.
REM Run once after the stack is up. Then in Temporal UI: Workflows -> Configure Workflow Table -> add pipelineName, operation, tenantId, userId.
setlocal
cd /d "%~dp0\.."

echo Registering custom search attributes (pipelineName, operation, tenantId, userId)...
echo.

REM Try Temporal CLI first, then tctl (admin-tools image may have either)
for %%a in (pipelineName operation tenantId userId) do (
  docker exec olo-temporal-admin-tools temporal operator search-attribute create --address temporal:7233 --name %%a --type Keyword 2>nul
  if errorlevel 1 docker exec olo-temporal-admin-tools tctl --address temporal:7233 admin cluster add-search-attributes --name %%a --type Keyword 2>nul
)

echo.
echo Done. In Temporal UI (http://localhost:8080): Workflows -^> Configure Workflow Table -^> add pipelineName, operation, tenantId, userId as columns.
if not "%~1"=="nopause" pause
