# Mesfin Getachew — Platform Engineering Portfolio

A static, GitHub Pages-ready portfolio presenting cloud platforms, Infrastructure as Code, Kubernetes, CI/CD and GitOps, DevSecOps, and Observability/SRE.

## Included

1. Responsive dark technical design and platform-engineering identity
2. Six capability areas: Cloud Platforms, IaC, Kubernetes, CI/CD & GitOps, DevSecOps, Observability/SRE
3. Seven project showcases, including featured CareFlow healthcare cloud platform
4. Individual engineering case-study pages, including `projects/careflow.html`
5. Project filtering by Platform / Cloud / Delivery (using the homepage's filter controls)
6. Experience timeline, certifications and education (verify source content before publishing)
7. Résumé path: `assets/resume/Mesfin-Getachew-Resume.pdf`
8. GitHub, LinkedIn and email CTAs (verify the links)
9. Mobile navigation and SEO/OpenGraph metadata
10. GitHub Pages deployment workflow
11. Original-image restoration and verification scripts

## Structure

```text
.
├── index.html
├── README.md
├── CONTENT-CHECKLIST.md
├── assets/{css,js,images,resume}/
├── projects/
├── scripts/
└── .github/workflows/deploy.yml
```

## Original image assets

Featured original filenames:
`careflow-logo.png`, `ai-incident-copilot.png`, `ai-infra-agent.png`, `cloud-migration.png`, `devops-project.png`, `java-gitops-pipeline.png`, `terraform-jenkins.png`.

Other original assets: `cdi-logo.png`, `claimwise-ai-logo.png`, `logo.png`, `profile.jpg`, `property-management-logo.png`, `python-mysql-db.png`, `shiro-logo.png`.

The uploaded ZIP does not contain all original binary image files. Restore them from the source repository:

```bash
bash scripts/sync-original-assets.sh
```

If the original branch/path differs, set `REPO_RAW` to the raw URL directory containing the image files:

```bash
REPO_RAW="https://raw.githubusercontent.com/OWNER/REPO/BRANCH/images" bash scripts/sync-original-assets.sh
```

## Résumé

Place your current résumé at `assets/resume/Mesfin-Getachew-Resume.pdf`. Verify the download link and use only a version you intend to publish.

## Preview and verify

```bash
python3 -m http.server 8000
# Open http://localhost:8000
bash scripts/verify-portfolio.sh
```

## Deploy to GitHub Pages

1. Push the repository to the `main` branch.
2. In GitHub, open **Settings → Pages** and select **GitHub Actions** as the source.
3. Push a commit or manually run the workflow in **Actions**.
4. Confirm the workflow succeeds.

Expected URL: `https://dataopsinnovator.github.io/mesfine-portfolio/`

## Publishing checklist

- [ ] Restore original images and confirm they render.
- [ ] Add the current résumé PDF.
- [ ] Verify name, contact details, GitHub and LinkedIn URLs.
- [ ] Verify employment dates, certifications and education.
- [ ] Ensure each case study describes work actually performed; label concepts clearly.
- [ ] Test all six project pages, mobile navigation and project filters.
- [ ] Test résumé download and social/contact links.
- [ ] Run `bash scripts/verify-portfolio.sh`.
- [ ] Confirm GitHub Pages deployment succeeds.
- [ ] Add metrics only when substantiated; do not invent cost, reliability or performance claims.

## Architecture choice

The site intentionally remains static: no backend, database or frontend framework is required.
