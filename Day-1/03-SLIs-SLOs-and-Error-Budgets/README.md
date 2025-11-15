# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: SLIs, SLOs, and Error Budgets

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → SLIs, SLOs, Error Budgets

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

This subtopic introduces **SLIs (Service Level Indicators)**, **SLOs (Service Level Objectives)**, and **Error Budgets**, which together form the foundational reliability measurement framework in SRE.

For IT engineers and developers, these concepts translate production behaviour into measurable engineering signals. Instead of subjective opinions like “the system feels slow,” SLIs and SLOs provide quantitative reliability definitions. Error budgets govern **how much unreliability is tolerable** before releases must pause and stability work must take priority.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* SLIs help identify where reliability degrades across infrastructure.
* SLOs provide clear operational targets for uptime, latency, and error rates.
* Error budgets guide when changes are safe versus risky.

### Developers

* SLOs define how fast APIs must respond and how many failures are acceptable.
* SLIs reveal how code changes impact user-visible reliability.
* Error budgets define whether new features can be released or need rollback.

### Realistic Mapping

```
SLI → A metric reflecting actual user experience
SLO → The target the engineering team commits to
Error Budget → Allowable failure within that target
```

---

# 3. Key Principles

### Principle 1: SLIs Reflect User Experience

SLIs are **quantitative measurements** of system behaviour. Examples:

* API success rate
* Request latency (P95 / P99)
* Throughput
* Availability
* Data freshness

### Principle 2: SLOs Are Engineering Commitments

SLOs define a reliability target:

```
Example:
"99.9% successful API requests per 30-day window"
```

### Principle 3: Error Budgets Balance Innovation and Stability

Error budgets quantify the **acceptable failure**, such as:

```
If SLO = 99.9% → allowable errors = 0.1% of requests
```

### Principle 4: Decisions Are Data-Driven

SRE decisions are not emotional; they are based on SLO compliance.

### Diagram: Relationship Overview

```
User Behaviour
     |
     v
SLIs (Measured Data)
     |
     v
SLOs (Targets)
     |
     v
Error Budget (Allowed Failure)
     |
     v
Engineering Decisions (Release / Stabilise)
```

---

# 4. Real-World Examples

### Example 1 — API Latency SLO

* SLIs show P99 latency climbing during peak hours.
* SLO requires P99 < 500ms.
* Developers identify inefficient DB query.
* IT engineers validate scalability improvements.

### Example 2 — OCI Load Balancer Backend Health (OCI Specific)

* SLI: `BackendHealthyHostCount` and response time.
* SLO: "99.95% of traffic served by healthy hosts."
* Issue: A backend VM becomes unhealthy under load.
* Error budget consumed rapidly.
* SRE initiates incident analysis and triggers autoscaling improvements.

### Example 3 — Deployment-Induced Errors

* Deployment increases error rate from 0.1% → 5%.
* SLO violation detected via SLIs.
* Error budget exhausted.
* Releases halted until root cause identified.

---

# 5. Case Study

### Scenario: A Billing API Experiences Latency Degradation

```
Users → LB → Billing API → Database
```

### Problem

* P99 latency jumps from 200ms → 1500ms.
* SLI: Latency at 99th percentile.
* SLO: P99 < 400ms.
* Error budget is consumed within hours.

### Investigation

* Developers identify slow database join.
* IT engineers observe CPU saturation on DB host.
* SRE correlates metrics with logs.
* Platform team updates DB instance shape.

### Result

* Latency restored.
* Error budget stabilised.
* Change management pipeline updated to include SLI checks.

---

# 6. Hands-On Exercise (Summary Only)

A dedicated hands-on lab will follow separately. It will cover:

* Defining SLIs for a sample OCI web application.
* Setting latency and availability SLOs.
* Calculating error budgets.
* Understanding error budget burn rate using Monitoring metrics.

---

# 7. Architecture / Workflow Diagrams

### Diagram 1 — SLI/SLO Flow

```
Request → Application → Metrics → Monitoring → SRE Decision
```

### Diagram 2 — Error Budget Burn

```
          SLO Target
              |
              v
+-----------------------------+
|   Allowed Failure Window    |
+-----------------------------+
     |                   |
     |                   v
     |              Budget Burn
     v
Violation → Release Freeze / Stability Focus
```

### Diagram 3 — Example Metrics Used

```
API Latency → P95/P99
API Errors → 5xx, timeouts
LB Health → Unhealthy backend count
Compute → CPU/Memory saturation
```

---

# 8. Best Practices

* Define SLIs based on user impact, not internal metrics alone.
* Keep SLOs realistic, not overly strict.
* Use error budgets as a governance mechanism.
* Review SLO compliance at least monthly.
* Align developers on reliability implications.
* IT engineers should monitor saturation, resource pressure, and network behaviours.

---

# 9. Common Mistakes

* Selecting SLIs developers find easy rather than those users care about.
* Setting overly aggressive SLOs without historical data.
* Ignoring error budget burn until it is fully exhausted.
* Using too many SLIs, causing confusion.
* Not integrating SLO checks into CI/CD or deployment pipelines.

---

# 10. Checklist

* Understand what SLIs, SLOs, and error budgets represent.
* Able to identify user-facing SLIs.
* Know how to calculate error budgets.
* Understand when to halt or slow releases based on budget.
* Recognise OCI metrics relevant to SLI definitions.

---

# 11. Additional Notes

* SLOs are not SLAs. SLAs involve financial penalties; SLOs are engineering tools.
* Error budgets help balance velocity and re
