# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: SLIs, SLOs, and Error Budgets

---

## 1. Concept Overview

This subtopic introduces **SLIs (Service Level Indicators)**, **SLOs (Service Level Objectives)**, and **Error Budgets**, which together form the foundational reliability measurement framework in SRE.

For IT engineers and developers, these concepts translate production behaviour into measurable engineering signals. Instead of subjective opinions like “the system feels slow,” SLIs and SLOs provide quantitative reliability definitions. Error budgets govern **how much unreliability is tolerable** before releases must pause and stability work must take priority.

---

## 2. How This Applies to IT Engineers and Developers

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

## 3. Key Principles

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

## 4. Real-World Examples

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

## 5. Case Study

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

## 7. Architecture / Workflow Diagrams

### Diagram 1 — SLI/SLO Flow

```
Request → Application → Metrics → Monitoring → SRE Decision
```

### Diagram 2 — Error Budget Burn
```
                        +-------------------------------------------+
                        | 1. Set SLO Target (The Reliability Goal)  |
                        |   (e.g., 99.9% availability over 30 days) |
                        +-------------------------------------------+
                                            |
                                            v
                +------------------------------------------------------------+
                | 2. Calculate Error Budget (The Allowance)                  |
                |   (From 99.9% SLO: 0.1% failure = 43 minutes over 30 days) |
                +------------------------------------------------------------+
                                            |
                                            |  (This budget can be consumed by...)
                                            v
                +------------------------------------------------------------+
                | 3. Failures / Errors Occur (The "Budget Burn")             |
                |   - Each incident "burns" a portion of the budget.         |
                |   - Example: A single 10-minute outage "burns" 10 minutes. |
                |     (Budget remaining: 43 - 10 = 33 minutes)               |
                +------------------------------------------------------------+
                                            |
                                            |  (If the budget is NOT yet empty...)
                                            |  (   ^                                )
                                            |  (   | If it IS empty...             )
                                            v  (   v                                )
    +-----------------------------------------------------------------------------------------+
    | 4. Monitor Budget Status (Is it depleted?)                                              |
    |   - Alerts can be triggered for rapid burn rates (e.g., "Warning: 50% of budget gone!") |
    +-----------------------------------------------------------------------------------------+
                                            |
                                            | (If total failures consume the entire budget...)
                                            v
                +----------------------------------------------------------+
                | 5. SLO Violation (Error Budget Exhausted)                |
                |   (e.g., Total failures exceed 43 minutes for the month) |
                +----------------------------------------------------------+
                                            |
                                            v
            +------------------------------------------------------------------+
            | 6. Consequence (Priorities Shift)                                |
            |   (e.g., Release Freeze, mandatory focus on stability/bug fixes) |
            +------------------------------------------------------------------+
```



### Diagram 3 — Example Metrics Used

```
API Latency → P95/P99
API Errors → 5xx, timeouts
LB Health → Unhealthy backend count
Compute → CPU/Memory saturation
```

---

## 8. Best Practices

* **Define SLIs based on user impact, not internal metrics alone.
    * **Example:** Measure **page load time** (what the user feels) instead of just **server CPU usage** (an internal metric).

* **Keep SLOs realistic, not overly strict.
    * **Example:** Start with a 99.9% ("three nines") availability target instead of an extremely difficult and expensive 99.999% ("five nines") target, unless it's truly critical.

* **Use error budgets as a governance mechanism.
    * **Example:** If the error budget is used up for the month, automatically **pause new feature releases** to force the team to focus on stability and bug fixes.

* **Review SLO compliance at least monthly.
    * **Example:** Hold a regular meeting to ask, "Did we meet our 99.9% target last month? Why or why not?" and plan any necessary corrections.

* **Align developers on reliability implications.
    * **Example:** When a developer is building a new feature, make sure they understand how it could **impact the error budget** and overall system performance.

* **IT engineers should monitor saturation, resource pressure, and network behaviours.
    * **Example:** An IT engineer should watch for signs that the **memory (RAM) is almost full** or the **network is getting congested**, *before* it causes an outage.
---

## 9. Common Mistakes

* Selecting SLIs developers find easy rather than those users care about.
* Setting overly aggressive SLOs without historical data.
* Ignoring error budget burn until it is fully exhausted.
* Using too many SLIs, causing confusion.
* Not integrating SLO checks into CI/CD or deployment pipelines.

---

## 10. Additional Notes

* SLOs are not SLAs. SLAs involve financial penalties; SLOs are engineering tools.
* Error budgets help balance velocity and reliability effectively.
