# Day 3 – Toil Reduction, Observability, and Automation

## Subtopic: Observability Principles

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Observability Principles

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

Observability is the ability to understand the internal state of a system **based on the data it produces**, especially during failures.
It goes beyond traditional monitoring by enabling engineers to:

* Ask new, unknown questions,
* Diagnose complex issues,
* Correlate signals across systems,
* Understand *why* something is happening, not just *what*.

Observability relies on **three pillars**:

1. **Metrics** – numerical measurements representing system behaviour.
2. **Logs** – event records providing detailed context.
3. **Traces** – request-level journey mapping across services.

While monitoring answers “is the system working?”, observability answers “why is it behaving this way?”.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Diagnose resource saturation.
* Correlate compute, network, and storage behaviours.
* Use metrics + logs + traces to identify bottlenecks.

### Developers

* Trace application-level requests.
* Inspect error logs and debug execution paths.
* Understand performance characteristics across microservices.

### Unified View

```
Metrics → What is happening?
Logs    → What events occurred?
Traces  → How did the request flow through systems?
```

Together → Full Observability.

---

# 3. Observability vs Monitoring

| Aspect   | Monitoring                | Observability             |
| -------- | ------------------------- | ------------------------- |
| Purpose  | Detect known issues       | Explore unknown issues    |
| Signals  | Mostly metrics            | Metrics, logs, traces     |
| Approach | Threshold-based           | Root-cause oriented       |
| Usage    | Alerts & surface symptoms | Diagnosis & deep analysis |

### Example:

* Monitoring alerts that CPU > 90%.
* Observability helps identify **which request**, **which code**, **which path** caused CPU spike.

---

# 4. The Three Pillars in Detail

## 4.1 Metrics

Numerical values representing system performance.
Examples:

* CPUUtilization
* MemoryUtilization
* Response latency
* Error counts

Key properties:

* Fast to query
* Useful for alerting
* Good for long-term trends

---

## 4.2 Logs

Detailed event records from systems and applications.
Examples:

* Application exceptions
* HTTP access logs
* System logs
* Security logs

Logs provide:

* Context around failures
* Precise timestamps
* Debugging information

---

## 4.3 Traces

Represent the journey of a request across services.
Useful for:

* Distributed systems
* Microservices architectures

Traces reveal:

* Slow components
* Internal dependencies
* Cross-service latency

---

# 5. Real-World Examples

### Example 1 — Slow API Response

* Metrics show latency spike.
* Logs show database timeouts.
* Trace reveals slow downstream dependency.

### Example 2 — OCI Compute CPU Saturation

* Metric identifies high CPU.
* Logs show a loop in application code.
* Trace shows high load on specific endpoint.

### Example 3 — Payment Gateway Failures

* Logs show recurring 502 errors.
* Metrics show increase in 5xx count.
* Traces pinpoint the retry storm.

---

# 6. Case Study

### Scenario: Checkout API slowdowns

User journey:

```
User → Load Balancer → API → Database → External Payment Service
```

### Issue

P99 latency > defined SLO.

### Observability Workflow

1. **Metrics** show latency spike.
2. **Logs** reveal database connection exhaustion.
3. **Traces** show long-running calls to payment API.

### Result

* Developers fix DB connection pooling.
* IT engineers optimize instance shape.
* SRE updates SLO dashboard.

---

# 7. Hands-On Exercise (Summary Only)

A complete lab will follow separately. It will include:

* Enabling system logs for Compute.
* Viewing logs in Log Explorer.
* Enabling application logs.
* Viewing sample traces (if tracing enabled).

---

# 8. Architecture / Workflow Diagrams

### Diagram 1 — Observability Flow

```
Resources → Metrics
          → Logs
          → Traces
                    ↓
                Observability
                    ↓
         Diagnosis, RCA, SLO Insights
```

### Diagram 2 — Example SRE Observability Loop

```
Symptoms → Signals → Correlation → Cause → Remediation
```

### Diagram 3 — Relationship of Signals

```
   Metrics       Logs        Traces
      \           |           /
       \          |          /
        +------ Observability ------+
```

---

# 9. Best Practices

* Emit structured JSON logs.
* Use consistent tagging across metrics and logs.
* Enable Cloud Agent for full system telemetry.
* Use percentiles for latency tracking.
* Implement correlation IDs in logs and traces.

---

# 10. Common Mistakes

* Only relying on metrics without logs.
* Not enabling detailed logs for applications.
* Missing correlation identifiers.
* Using average metrics for decisions.

---

# 11. Checklist

* Understand the 3 pillars.
* Know when to use metrics vs logs vs traces.
* Use observability tools to perform root-cause analysis.
* Ensure all application tiers emit necessary telemetry.

---

# 12. Additional Notes

* Observability investments pay off during high-severity incidents.
* This subtopic prepares you for logging-based metrics (Subtopic 3).
