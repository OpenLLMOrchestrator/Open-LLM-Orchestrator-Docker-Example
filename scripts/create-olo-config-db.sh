#!/usr/bin/env bash
# Create olo_config database on postgres (used by Open LLM Orchestrator Worker for config storage).
# Run once after the stack is up. Safe to run multiple times (ignores "already exists").
set -e
cd "$(dirname "$0")/.."
echo "Creating database olo_config on olo-postgres..."
docker exec olo-postgres psql -U temporal -d temporal -c "CREATE DATABASE olo_config;" 2>/dev/null || true
echo "Done. Database olo_config is ready (or already exists)."
