@echo off
REM Create olo_config database on postgres (used by Open LLM Orchestrator Worker for config storage).
REM Run once after the stack is up. Safe to run multiple times (ignores "already exists").
cd /d "%~dp0\.."
echo Creating database olo_config on olo-postgres...
docker exec olo-postgres psql -U temporal -d temporal -c "CREATE DATABASE olo_config;" 2>nul
if %errorlevel% equ 0 (echo Done. Database olo_config is ready.) else (echo Database may already exist or postgres not running.)
pause
