# Day 2 – Measuring Reliability and Monitoring on OCI

## Subtopic: Dashboards and Visualization

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → Dashboards and Visualization

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

OCI Dashboards provide a unified, visual workspace where engineers can monitor system health, track SLO performance, and observe real‑time infrastructure signals. Dashboards aggregate multiple metric charts, alarm widgets, logs, and custom metric visualizations into a single operational view.

Dashboards serve two primary purposes:

* **Operational monitoring** — day‑to‑day visibility for IT engineers and on‑call responders.
* **Reliability monitoring** — verifying SLIs/SLOs and observing error budget burn.

Key dashboard elements include:

* Prebuilt and custom visual panels
* Metric charts with percentiles
* Alarm status widgets
* Compartment‑level resource summaries
* Log‑based visualizations

This subtopic focuses on creating meaningful dashboards that highlight reliability indicators.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Use dashboards for real‑time resource health.
* Observe CPU, memory, disk, and network behaviours.
* Track load balancer backend health and traffic.

### Developers

* View application latency, errors, and throughput.
* Monitor custom metrics (e.g., request latency, error rate).
* Understand how code impacts production behaviour.

### Unified View

```
Metrics + Logs + Alarms → SLO‑Aligned Dashboards → Decision Making
```

---

# 3. Key Concepts

## 3.1 Dashboard Types

* **Custom Dashboards** — user‑built, flexible layouts.
* **Service Dashboards** — prebuilt views for Compute, VCN, LB, and others.

---

## 3.2 Widgets

Widgets include:

* Metric charts
* Alarm summary blocks
* Logs timeline widget
* Top‑N resource lists
* Text and annotation blocks

---

## 3.3 SLO‑Focused Panels

SRE‑aligned dashboards should include:

* P95/P99 latency
* Error rate
* Availability indicators
* Healthy backend counts
* Custom application metrics
* Error budget consumption indicators

---

# 4. Real‑World Examples

### Example 1 — API Latency Dashboard

* P99 latency trending upward indicates overload.
* Developers link spike to heavy DB queries.

### Example 2 — Load Balancer Health Visualization

* Sudden drop in healthy backend nodes shows deployment failure.

### Example 3 — Error Rate Panel Using Custom Metrics

* Custom metric `custom.myapp.errors` shows burst of failures.

---

# 5. Case Study

### Scenario: SLO Dashboard for Checkout API

A service‑level dashboard shows:

* P99 latency
* Error percentage
* Healthy backend hosts
* CPU and memory for application VMs
* Alarm status

### Finding

* During peak load, P99 latency breach causes SLO violation.
* Dashboard clearly shows CPU saturation → scaling required.

### Result

* Team adjusts autoscaling thresholds.
* SLO violations significantly reduced.

---

# 6. Hands‑On Exercise (Summary Only)

A detailed lab will be created separately.
It will include:

* Building a dashboard with latency, uptime, and success‑rate metrics.
* Adding alarm widgets.
* Displaying compute and load balancer metrics.

---

# 7. Architecture / Workflow Diagrams

### Diagram 1 — Dashboard as a Reliability View

```
+--------------------------------------------------+
|                SRE Operational Dashboard          |
|--------------------------------------------------|
|  Latency (P95/P99)    |   Error Rate             |
|------------------------|--------------------------|
|  Healthy Backends     |   Alarm Status           |
|------------------------|--------------------------|
|  Compute CPU/Mem      |   Custom Metrics         |
+--------------------------------------------------+
```

### Diagram 2 — Data Flow to Dashboard

```
Resource → Metrics → Monitoring → Dashboard Widgets → Reliability Insight
```

### Diagram 3 — SLO‑Driven Visualization

```
SLI Metrics → SLO Threshold Lines → Visual Comparison
```

---

# 8. Best Practices

* Use p95/p99 for latency‑based panels.
* Add alarm widgets for quick incident triage.
* Group panels by service tier (LB → App → DB).
* Use consistent time windows across panels.
* Highlight SLO threshold lines in charts.

---

# 9. Common Mistakes

* Too many panels creating noise.
* Using average latency instead of percentiles.
* Missing backend health visibility.
* No linkage between metrics and SLOs.
* Overloaded dashboards without grouping.

---

# 10. Checklist

* Identify key SLI metrics.
* Add percentile‑based latency panels.
* Add error and availability indicators.
* Use alarm summary widgets.
* Validate data sources and dimensions.

---

# 11. Additional Notes

* Dashboards form the visual foundation for Day 4’s high‑availability validation and Day 5’s operational excellence exercises.
