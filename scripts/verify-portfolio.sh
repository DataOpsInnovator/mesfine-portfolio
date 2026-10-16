#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
failed=0
for f in index.html README.md CONTENT-CHECKLIST.md assets/css/main.css assets/js/main.js scripts/sync-original-assets.sh .github/workflows/deploy.yml projects/ai-infra-agent.html projects/careflow.html assets/diagrams/careflow-reference-architecture.svg assets/diagrams/ai-infra-agent-review-workflow.svg assets/diagrams/ai-infra-agent-orchestrator-pipeline.svg projects/ai-incident-copilot.html projects/java-gitops.html projects/cloud-migration-dr.html projects/terraform-jenkins.html projects/devops-cicd.html; do
  if [[ -f "$ROOT/$f" ]]; then echo "OK   $f"; else echo "MISS $f"; failed=1; fi
done
for f in ai-incident-copilot.png ai-infra-agent.png cloud-migration.png devops-project.png java-gitops-pipeline.png terraform-jenkins.png; do
  [[ -s "$ROOT/assets/images/$f" ]] && echo "OK   image $f" || echo "NOTE image missing: $f (run scripts/sync-original-assets.sh)"
done
exit "$failed"
