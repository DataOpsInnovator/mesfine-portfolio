#!/usr/bin/env bash
set -euo pipefail
REPO_RAW="${REPO_RAW:-https://raw.githubusercontent.com/DataOpsInnovator/mesfine-portfolio/master/images}"
DEST="$(cd "$(dirname "$0")/.." && pwd)/assets/images"
mkdir -p "$DEST"
files=(ai-incident-copilot.png ai-infra-agent.png cdi-logo.png claimwise-ai-logo.png cloud-migration.png devops-project.png java-gitops-pipeline.png logo.png profile.jpg property-management-logo.png python-mysql-db.png shiro-logo.png terraform-jenkins.png)
for file in "${files[@]}"; do
  echo "Restoring $file"
  curl --fail --location --retry 2 --silent --show-error "$REPO_RAW/$file" -o "$DEST/$file" || { echo "Failed: $file. Check REPO_RAW/branch/path." >&2; exit 1; }
done
echo "Image restoration complete: $DEST"
