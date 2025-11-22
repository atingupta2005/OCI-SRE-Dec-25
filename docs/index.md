# SRE & OCI Training — Course Site

Welcome to the **SRE & OCI** training documentation. This site contains instructor notes, hands-on labs, architecture diagrams, and exercises across multiple days.

---

## Quick Links

- Use the left navigation to jump to any Day or Topic.
- Each topic contains a **Readme** and a **Hands-on** lab where applicable.
- Use the search box to find keywords like `SLI`, `SLO`, `OCI`, `Logstash`, `Filebeat`, etc.

---

## Course Overview

This training is organised into Day-wise modules:

- **Day 1 — SRE Fundamentals & OCI Foundations**  
  Introduction, SRE vs DevOps vs Platform Engineering, SLIs/SLOs/Error Budgets, OCI Core Architecture.

- **Day 2 — Measuring Reliability & Designing SLOs**  
  Dashboards, Visualization, SLI/SLO Design, Hands-on monitoring labs.

- **Day 3 — Toil Reduction, Observability & Automation**  
  Observability principles, logging-based metrics, automation with resource manager.

- **Day 4 — High Availability & Incident Response**  
  HA design, resilience & recovery, incident response and postmortem best practices.

---

## Prerequisites (Short)

- Basic Linux command-line familiarity
- A GitHub account (for optional publishing)
- Python 3.8+ (for local preview with MkDocs)

---

## Want this site deployed publicly?

I have included a GitHub Actions workflow in `.github/workflows/gh-pages.yml`. Follow the README in the project root to create a repo and connect the `GITHUB_TOKEN` (automatic on GitHub) and the site will publish on push to `main`.