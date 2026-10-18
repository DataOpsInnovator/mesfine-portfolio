#!/usr/bin/env bash
set -euo pipefail
# Restore only missing raster assets; never overwrite files already present.
REPO_RAW="${REPO_RAW:-https://raw.githubusercontent.com/DataOpsInnovator/mesfine-portfolio/master/assets/images}"
DEST="$(cd "$(dirname "$0")/.." && pwd)/assets/images"
mkdir -p "$DEST"
files=(ai-incident-copilot.png ai-infra-agent.png cdi-logo.png claimwise-ai-logo.png cloud-migration.png devops-project.png java-gitops-pipeline.png property-management-logo.png python-mysql-db.png shiro-logo.png terraform-jenkins.png)
for file in "${files[@]}"; do
  if [[ -s "$DEST/$file" ]]; then printf 'KEEP  %s (already present)\n' "$file"; continue; fi
  printf 'FETCH %s\n' "$file"
  curl --fail --location --retry 2 --silent --show-error "$REPO_RAW/$file" -o "$DEST/$file" || {
    rm -f "$DEST/$file"
    printf 'Failed to restore %s. Check REPO_RAW, branch, and asset path.\n' "$file" >&2
    exit 1
  }
done
echo "Missing asset restoration complete: $DEST"
