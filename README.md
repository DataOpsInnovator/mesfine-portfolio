# Mesfin Getachew — Platform Engineering Portfolio

Live site: <https://dataopsinnovator.github.io/mesfine-portfolio/>

A static portfolio for cloud platform engineering work: AWS and Azure, Kubernetes, Infrastructure as Code, CI/CD and GitOps, DevSecOps, and observability. Each project has a case study that states what its source repository contains and what is a reference pattern.

## Case studies

| Project | Focus |
| --- | --- |
| CareFlow | Multi-region healthcare cloud platform (synthetic data) |
| AI-Infra-Agent | AI-assisted Terraform and infrastructure review |
| AI-Incident-Copilot | Local retrieval-augmented incident assistant (Python, Oracle Database 26ai, LangChain, Ollama) |
| Java GitOps CI/CD Platform | Jenkins, Maven, SonarQube, Helm, Argo CD and Kubernetes |
| Cloud Migration & DR | AWS and Azure migration and disaster recovery with Terraform and Ansible |
| Terraform on AWS | Terraform infrastructure code; the CI delivery diagram is a reference pattern, because the source repository has no Jenkinsfile |
| Jenkins Terraform Pipeline | Parameterized Jenkins pipeline for the Terraform lifecycle on AWS; no Docker or Kubernetes delivery pipeline |

## Stack

Plain HTML, CSS and vanilla JavaScript. There is no build step, no framework, and no third-party script. Diagrams and project artwork are inline-friendly SVG.

```text
.
├── index.html                  # single-page portfolio
├── projects/                   # one case-study page per project
├── assets/
│   ├── css/main.css
│   ├── js/main.js              # mobile menu, project filters
│   ├── images/                 # project artwork, profile, social card, favicon
│   ├── diagrams/               # architecture SVGs
│   └── resume/
├── scripts/verify-portfolio.sh # required files and local reference check
└── .github/
    ├── workflows/deploy.yml    # validate, then deploy to GitHub Pages
    ├── workflows/quality.yml   # HTML validation, link check, Lighthouse
    └── dependabot.yml          # weekly updates for pinned Actions
```

## Run locally

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Checks

```bash
bash scripts/verify-portfolio.sh                       # required files and local links
npx html-validate@9.7.1 index.html "projects/*.html"   # HTML validity (config: .htmlvalidate.json)
```

On every pull request and push, GitHub Actions runs:

- **Validate and deploy** (`deploy.yml`): the verifier, then deployment to GitHub Pages on pushes to the default branch.
- **Quality checks** (`quality.yml`): HTML validation, local and external link checks, and Lighthouse CI with minimum scores for accessibility (0.95) and SEO (0.9), and warnings for best practices and performance (`.lighthouserc.json`).

All Actions are pinned to commit SHAs; Dependabot proposes updates.

## Deploy

1. In **Settings → Pages**, set the source to **GitHub Actions**.
2. Push to `master` (the workflows also accept `main`).
3. Confirm the **Validate and deploy** workflow succeeds.

## Content rules

- Describe only what the source repository contains. Label concepts and reference patterns as such.
- Publish metrics, SLOs, cost savings, compliance claims and certifications only when they can be substantiated.
- Keep descriptions on the home page, the case-study pages, and the diagrams consistent.
- Keep keyboard access, visible focus, descriptive link text, reduced-motion support, and `rel="noopener noreferrer"` on links that open in a new tab.
