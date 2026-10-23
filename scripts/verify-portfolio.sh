#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
required=(
  "index.html" "README.md" "CONTENT-CHECKLIST.md"
  "assets/css/main.css" "assets/js/main.js"
  "scripts/sync-original-assets.sh" ".github/workflows/deploy.yml"
  "assets/images/profile.png" "assets/images/favicon.svg" "assets/images/social-card.png"
  "assets/images/careflow-brand.svg" "assets/images/ai-infra-agent-brand.svg"
  "assets/images/ai-incident-copilot-brand.svg" "assets/images/java-gitops-brand.svg"
  "assets/images/cloud-migration-dr-brand.svg" "assets/images/terraform-jenkins-brand.svg"
  "assets/images/devops-cicd-brand.svg"
  "assets/diagrams/careflow-reference-architecture.svg"
  "assets/diagrams/ai-infra-agent-review-workflow.svg"
  "assets/diagrams/ai-infra-agent-orchestrator-pipeline.svg"
  "assets/diagrams/ai-incident-copilot-architecture.svg"
  "assets/diagrams/java-gitops-pipeline.svg"
  "assets/diagrams/cloud-migration-dr-architecture.svg"
  "assets/diagrams/terraform-jenkins-architecture.svg"
  "assets/diagrams/devops-cicd-pipeline-architecture.svg"
  "projects/ai-infra-agent.html" "projects/ai-incident-copilot.html"
  "projects/careflow.html" "projects/java-gitops.html"
  "projects/cloud-migration-dr.html" "projects/terraform-jenkins.html"
  "projects/devops-cicd.html"
)
failed=0
for f in "${required[@]}"; do
  if [[ -f "$ROOT/$f" ]]; then printf 'OK   %s\n' "$f"; else printf 'MISS %s\n' "$f"; failed=1; fi
done
if [[ "$failed" -ne 0 ]]; then echo "Required-file validation failed." >&2; exit 1; fi
python3 - "$ROOT" <<'PY'
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit
import sys
root = Path(sys.argv[1]).resolve()
skip = {".git", ".github"}
attrs = ("href", "src", "poster", "data-src")
class Parser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.refs = []
    def handle_starttag(self, tag, attrs):
        for key, value in attrs:
            if key in ("href", "src", "poster", "data-src") and value:
                self.refs.append((key, value.strip()))
errors, count = [], 0
for page in sorted(root.rglob("*.html")):
    if any(part in skip for part in page.relative_to(root).parts):
        continue
    html = page.read_text(encoding="utf-8")
    if r"\n<meta" in html:
        errors.append(f"{page.relative_to(root)}: literal backslash-n before metadata tag")
    parser = Parser()
    parser.feed(html)
    for attr, raw in parser.refs:
        if raw.startswith(("#", "data:", "mailto:", "tel:", "javascript:")):
            continue
        u = urlsplit(raw)
        if u.scheme or u.netloc or not u.path:
            continue
        target = (page.parent / unquote(u.path)).resolve()
        try:
            target.relative_to(root)
        except ValueError:
            errors.append(f"{page.relative_to(root)}: {attr} escapes repository: {raw}")
            continue
        count += 1
        if not target.exists():
            errors.append(f"{page.relative_to(root)}: missing {attr} target: {raw}")
if errors:
    print("Local HTML reference validation failed:")
    print("\n".join(" - " + e for e in errors))
    sys.exit(1)
print(f"Local HTML reference validation passed ({count} local references checked).")
PY