#!/usr/bin/env bash
# Register custom search attributes so they appear in Temporal UI workflow table.
# Run once after the stack is up. Then in Temporal UI: Workflows -> Configure Workflow Table -> add pipelineName, operation, tenantId, userId.
set -e
cd "$(dirname "$0")/.."

echo "Registering custom search attributes (pipelineName, operation, tenantId, userId)..."
echo ""

for attr in pipelineName operation tenantId userId; do
  docker exec olo-temporal-admin-tools temporal operator search-attribute create --address temporal:7233 --name "$attr" --type Keyword 2>/dev/null || \
  docker exec olo-temporal-admin-tools tctl --address temporal:7233 admin cluster add-search-attributes --name "$attr" --type Keyword 2>/dev/null || true
done

echo ""
echo "Done. In Temporal UI (http://localhost:8080): Workflows -> Configure Workflow Table -> add pipelineName, operation, tenantId, userId as columns."
