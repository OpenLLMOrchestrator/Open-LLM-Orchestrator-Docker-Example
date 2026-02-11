@echo off
echo 🚀 Starting Open LLM Orchestrator stack...

docker compose up -d

echo ⏳ Waiting for Ollama to be ready...

:waitloop
docker exec olo-ollama ollama list >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 2 >nul
    goto waitloop
)

echo 📦 Pulling Mistral model (first run only)...
docker exec olo-ollama ollama pull mistral

echo.
echo ✅ Stack is ready!
echo.
echo 🌐 Chat UI      : http://localhost:3000
echo 🧠 Temporal UI  : http://localhost:8233
echo ⚙️  Control API : http://localhost:8080
pause
