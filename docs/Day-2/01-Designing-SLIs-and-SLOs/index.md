# Day 2 – Designing and Implementing Reliability Measures

## Subtopic: Designing SLIs and SLOs

### TOC Reference: Day 2 → Designing SLIs & SLOs → Designing SLIs and SLOs

### Audience Context: IT Engineers and Developers

---

## 1. Concept Overview

Designing effective **Service Level Indicators (SLIs)** and **Service Level Objectives (SLOs)** is foundational to measurable reliability engineering. While Day 1 introduced the definitions and concepts, Day 2 focuses on the **engineering process** of designing practical, meaningful, and enforceable SLIs and SLOs.

This involves:

* Understanding user journeys
* Identifying critical request paths
* Mapping request paths to measurable signals
* Deciding which signals represent **true customer experience
* Designing realistic and enforceable reliability targets

This process ensures that reliability goals are:

* Aligned to system behaviour
* Observable via actual metrics
* Measurable in real time
* Used to guide release decisions

---

## 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Must ensure metrics are emitted, collected, and usable in Monitoring.
* Design network, compute, and infrastructure paths that produce SLI-aligned signals.
* Know how failures in networking or compute show up as SLI violations.

### Developers

* Must write code that generates traceable, measurable behaviour.
* Implement structured logging, error codes, latency measurement, and request correlation.
* Validate reliability-impacting code paths before releasing.

### Unified View

```
SLI = What to measure
SLO = Target for that measurement
Infrastructure & code must produce measurable signals
```

---

## 3. Key Principles

### Principle 1: SLIs Should Measure User Experience

Examples:

* Latency of API responses
* Success rate of requests
* Percentage of valid responses
* Availability of service endpoints

### Principle 2: SLOs Should Be Realistic

SLOs should be:

* Based on historical performance
* Achievable with the current architecture
* Tied to business impact

### Principle 3: Only Few SLIs Should Be Chosen

Over-monitoring creates noise; under-monitoring hides problems.

### Principle 4: Measure At the Right Location

Measure the user-facing point, not internal components.

Example:

```
Correct SLI: Latency measured at LB → end user perspective
Incorrect SLI: DB query time only → internal metric
```

### Principle 5: Tie SLOs to Error Budgets

Error budgets guide release decisions.

---

## 4. Real-World Examples

### Example 1 — API Latency SLI for Billing Service

* User-facing latency measured at LB.
* Developers collect internal latency from code.
* SRE uses LB latency for SLI, internal metrics for debugging.

### Example 2 — OCI Block Volume Latency

* IT engineer observes occasional I/O spikes.
* SRE ties storage latency to SLO thresholds.
* Developers optimize disk-heavy operations.

### Example 3 (OCI Specific) — Load Balancer Unhealthy Host Count

* LB health checks detect failing backends.
* SLI: Healthy backend percentage.
* SLO: "99% of time at least 1 healthy backend available".

---

## 5. Case Study

### Scenario: Designing SLIs for an E‑Commerce API

User flow:

```
User → Load Balancer → API → Database → External Payment Service
```

### Critical SLIs

1. **Checkout API success rate
2. **Checkout P99 latency
3. **Payment gateway call success rate

### SLO Targets

```
SLO 1: Checkout API success rate ≥ 99.5%
SLO 2: P99 latency < 600 ms
SLO 3: Payment gateway reliability ≥ 99.0%
```

### Reasoning

* Checkout must be fast and reliable.
* Payment gateway has external dependency; SLO must reflect this.

### Error Budget

```
If SLO1 = 99.5% → error budget = 0.5%
If 2M monthly requests → 10,000 failures allowed
```

### Improvements

* Add caching to reduce DB load.
* Add retries for payment API.
* Deploy across multiple ADs.

---

## 6. Hands-On Exercise (Summary Only)

The full hands-on lab will be provided separately. It will include:

* Mapping user journeys for an OCI-hosted web/API service
* Extracting latency and success-rate metrics from Monitoring
* Choosing meaningful SLIs
* Calculating SLOs and error budgets
* Designing SLO dashboards

---

## 7. Architecture / Workflow Diagrams

### Diagram 1 — SLI/SLO Design Flow

```
User Journey → Critical Paths → Metrics → SLIs → SLO Targets → Error Budget
```

### Diagram 2 — Where Different Teams Contribute

```
Developers → Emit logs/metrics
IT Engineers → Build infra paths
SRE → Define SLIs/SLOs + Validate signals
```

### Diagram 3 — Example Signal Flow

```
Application → LB → Metrics → Monitoring → SLO Evaluation
```

---

## 8. Best Practices

* Keep SLIs simple but meaningful.
* Validate SLI availability in Monitoring before adopting.
* Choose SLOs that reflect business needs.
* Reassess SLOs every quarter.
* Use SLO violations to trigger blameless reviews.

---

## 9. Common Mistakes

* Using too many SLIs.
* Confusing internal metrics with user-facing metrics.
* Setting unrealistic SLOs.
* Not reviewing SLOs over time.
* Forgetting that external dependencies also require SLIs.

---

## 10. Checklist

* Understand how to identify user-facing SLIs.
* Know how to derive SLO targets.
* Ability to calculate error budgets.
* Understand how infrastructure affects SLIs.
* Able to explain why SLOs drive release decisions.

---

## 11. Additional Notes

* SLO and error budget design becomes easier with observability maturity.
* OCI provides built-in metrics that simplify SLI definition.
