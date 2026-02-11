#!/bin/bash

set -e

echo "🚀 Starting Open LLM Orchestrator stack..."

docker compose up -d

echo "⏳ Waiting for Ollama to be ready..."

until docker exec olo-ollama ollama list >/dev/null 2>&1; do
  sleep 2
done

echo "📦 Pulling Mistral model (first run only)..."
docker exec olo-ollama ollama pull mistral || true

echo ""
echo "✅ Stack is ready!"
echo ""
echo "🌐 Chat UI      : http://localhost:3000"
echo "🧠 Temporal UI  : http://localhost:8233"
echo "⚙️  Control API : http://localhost:8080"
echo ""
