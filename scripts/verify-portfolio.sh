#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
failed=0
for f in index.html README.md CONTENT-CHECKLIST.md assets/css/main.css assets/js/main.js scripts/sync-original-assets.sh .github/workflows/deploy.yml projects/ai-infra-agent.html projects/careflow.html assets/diagrams/careflow-reference-architecture.svg assets/diagrams/ai-infra-agent-review-workflow.svg assets/diagrams/ai-infra-agent-orchestrator-pipeline.svg projects/ai-incident-copilot.html projects/java-gitops.html projects/cloud-migration-dr.html projects/terraform-jenkins.html projects/devops-cicd.html assets/diagrams/ai-incident-copilot-architecture.svg assets/diagrams/java-gitops-pipeline.svg assets/diagrams/cloud-migration-dr-architecture.svg assets/diagrams/terraform-jenkins-architecture.svg assets/diagrams/devops-cicd-pipeline-architecture.svg assets/images/profile.jpg assets/images/careflow-brand.svg assets/images/ai-infra-agent-brand.svg assets/images/ai-incident-copilot-brand.svg assets/images/java-gitops-brand.svg assets/images/cloud-migration-dr-brand.svg assets/images/terraform-jenkins-brand.svg assets/images/devops-cicd-brand.svg; do
  if [[ -f "$ROOT/$f" ]]; then echo "OK   $f"; else echo "MISS $f"; failed=1; fi
done
exit "$failed"
