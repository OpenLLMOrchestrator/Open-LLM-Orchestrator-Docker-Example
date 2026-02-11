# Open LLM Orchestrator – Docker Example

This repository provides a ready-to-run Docker Compose setup for Open LLM Orchestrator.

It brings up a complete Temporal-native RAG stack with a single command.

---

## 🚀 What This Stack Includes

- Temporal Server
- Temporal UI
- Qdrant (Vector Database)
- Ollama (LLM Runtime)
- Open LLM Orchestrator (Control Plane)
- React Chat UI

---

## 🧠 Architecture Overview

Chat UI  
→ Control Plane (Spring Boot + Temporal)  
→ RAG Workflow  
→ Qdrant (Vector Search)  
→ Ollama (Mistral LLM)  
→ Response  

All inference is orchestrated via Temporal workflows.

---

## ⚡ Quick Start

### 1️⃣ Start the stack

```bash
docker compose up -d


### Linux / macOS

./scripts/start.sh

### Windows

scripts\start.bat


#Stop:

./scripts/stop.sh
scripts\stop.bat


