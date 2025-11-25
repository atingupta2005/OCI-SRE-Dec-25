# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: SRE vs DevOps vs Platform Engineering

---

## 1. Concept Overview

This subtopic explains the distinctions and intersections between three engineering disciplines: **Site Reliability Engineering (SRE)**, **DevOps**, and **Platform Engineering**. IT engineers and developers often interact with all three without fully understanding how each contributes to system stability, scalability, and velocity.

The purpose is to offer a clear, structured comparison focused on:

* Responsibilities
* Objectives
* Methods of working
* How each discipline impacts system reliability

These distinctions help engineers collaborate more effectively and understand who owns which part of the reliability landscape.

---

## 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Helps clarify why SRE takes ownership of reliability rather than just performing ops tasks.
* Explains how Platform Engineering creates the internal tools and paved roads IT engineers rely on.
* Shows how DevOps practices impact deployment and operational workflows.

### Developers

* Helps understand how their code interacts with SRE-defined reliability standards.
* Shows where Platform Engineering provides reusable components (CI/CD templates, infra modules).
* Illustrates how DevOps practices influence the development lifecycle.

### Combined View

```
Developer: Writes and tests code
DevOps: Enables smooth build/deploy cycles
Platform Engineering: Provides internal tooling & reusable infrastructure
SRE: Ensures reliability, observability, and operational excellence
```

---

## 3. Key Principles

### Site Reliability Engineering (SRE)

* Reliability as an engineering goal tracked through SLIs/SLOs.
* Focused on automation, observability, incident response, and capacity planning.
* Ensures systems behave consistently under varied load conditions.

### DevOps

* Cultural and technical movement improving collaboration between dev and ops.
* Emphasises CI/CD, faster delivery, automation, and shared ownership.
* Focuses on deployment pipelines, environment consistency, and integration cycles.

### Platform Engineering

* Builds internal platforms used by developers and engineers to deploy, test, and operate services.
* Provides reusable modules, paved roads, templates, and abstractions.
* Focuses on improving developer experience and productivity.

### Diagram: Separation of Responsibilities

```
+-----------------+     +------------------+     +---------------------------+
|     SRE         |     |      DevOps      |     |    Platform Engineering   |
+-----------------+     +------------------+     +---------------------------+
| Reliability     |     | CI/CD Pipelines  |     | Internal Tools & Systems |
| Observability   |     | Deployment Flow  |     | Developer Enablement     |
| Incident Mgmt   |     | Integration      |     | Infrastructure Modules    |
| Capacity        |     | Automation       |     | Service Catalogs         |
+-----------------+     +------------------+     +---------------------------+
```

---

## 4. Real-World Examples

### Example 1 — Deployment Failure

* Developers push a new version.
* DevOps pipeline deploys it.
* Application becomes slow.
* SRE investigates latency spikes and error rates.
* Platform Engineering later provides a safer deployment pattern using canary modules.

### Example 2 — Scalability Requirements

* IT engineers notice traffic spikes on weekends.
* SRE analyses saturation metrics and error budgets.
* Platform Engineering introduces an autoscaling Terraform module.
* DevOps updates pipelines to use the new module.

---

## 5. Case Study

### Scenario: Unreliable Release Process Causing Frequent Outages

### Architecture Overview

```
Developers → DevOps Pipelines → Application Deployment → Application Instances
                                                |                |
                                                v                v
                                       Platform Tools      SRE Monitoring
```

### Problem

* Frequent outages after deployments.
* CI/CD pipelines do not include automated health checks.
* Developers rely on manual verification.
* No SLOs defined, leading to unclear reliability expectations.

### How Each Discipline Responds

* **SRE:** Defines SLIs (availability, latency), sets SLO targets, adds health-based release gates.
* **DevOps:** Updates CI/CD pipeline to include blue-green deployment with pre-traffic validation.
* **Platform Engineering:** Creates reusable deployment templates with built-in health checks.

### Result

* Deployment failures reduced significantly.
* Release confidence improved.
* Reliability became a shared responsibility.

---

## 6. Architecture / Workflow Diagrams

### Workflow: Where Each Discipline Operates

```
+--------------+       +--------------+       +---------------------------+
|  Developers  | ----> |    DevOps    | ----> | Platform Engineering      |
+--------------+       +--------------+       +---------------------------+
       |                        |                         |
       v                        v                         v
Write Code                  Deploy Code           Provide Tools/Modules
       |                        |                         |
       +---------------------------------------------------+
                           |
                           v
                        +------+
                        | SRE  |
                        +------+
                          |
             Reliability, Observability, Incident Mgmt
```

---

## 7. Best Practices

* Clearly define ownership boundaries between SRE, DevOps, and Platform teams.
* Developers should rely on platform-provided tooling whenever possible.
* SRE should define measurable reliability goals (SLOs) for critical services.
* DevOps pipelines should integrate SRE checks (health checks, metrics validation).
* Platform teams should maintain consistency and reusability.

---

## 8. Common Mistakes

* Treating SRE as a replacement for DevOps or IT Ops.
* Assuming DevOps owns reliability.
* Developers bypassing platform tooling and creating inconsistent deployments.
* Lack of unified observability across teams.
* Missing SLOs leading to unclear reliability responsibilities.

---

## 11. Additional Notes

* Real-world organisations blend these roles differently, but the underlying principles remain consistent.
* Understanding these distinctions helps IT engineers and developers work effectively across cross-functional teams.
