#!/usr/bin/env bash
# Open LLM Orchestrator - One-Click Install (Linux / macOS)
set -e

cd "$(dirname "$0")"

echo ""
echo "============================================================"
echo "  Open LLM Orchestrator - One-Click Setup (Open Source)"
echo "============================================================"
echo ""

# Step 1: Check Docker is installed
echo "[Step 1/2] Checking Docker..."
if ! docker --version >/dev/null 2>&1; then
  echo ""
  echo "ERROR: Docker is not installed or not in PATH."
  echo ""
  echo "Please install Docker Engine first:"
  echo "  https://docs.docker.com/engine/install/"
  echo ""
  echo "Then start the Docker service and run this script again."
  echo "  e.g. sudo systemctl start docker"
  echo ""
  exit 1
fi
docker --version
echo ""

# Step 2: Check Docker daemon is running
echo "[Step 2/2] Checking Docker is running..."
if ! docker info >/dev/null 2>&1; then
  echo ""
  echo "ERROR: Docker is installed but not running."
  echo "Please start the Docker service and try again."
  echo "  e.g. sudo systemctl start docker"
  echo "  or start Docker Desktop if you use it."
  echo ""
  exit 1
fi
echo "Docker is running."
echo ""

echo "------------------------------------------------------------"
echo "Checking for updated images (Docker Hub)..."
echo "------------------------------------------------------------"
docker compose pull --ignore-pull-failures
echo ""

echo "------------------------------------------------------------"
echo "Starting the stack and downloading OSS models..."
echo "This may take several minutes on first run."
echo "------------------------------------------------------------"
echo ""

./scripts/start.sh

echo ""
echo "------------------------------------------------------------"
echo "Ensuring Temporal UI columns (pipelineName, operation, tenantId, userId)..."
echo "------------------------------------------------------------"
./scripts/add-temporal-search-attributes.sh

echo ""
echo "Done. Run ./scripts/stop.sh or 'docker compose down' to stop the stack."
