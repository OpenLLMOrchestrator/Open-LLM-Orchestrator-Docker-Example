#!/bin/bash

echo "⚠️  Resetting environment..."

docker compose down -v

docker volume rm openllm-orchestrator_ollama_data 2>/dev/null || true

echo "✅ Environment reset complete."
