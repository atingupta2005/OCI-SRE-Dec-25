# Day 3 – Toil Reduction, Observability, and Automation

## Subtopic: Logging-Based Metrics

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Logging-based Metrics

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

Logging-based metrics allow engineers to convert log events into numerical metrics for monitoring, alerting, and SLO evaluation. They are essential when:

* No default OCI metric exists for a behaviour,
* Application logs contain reliability signals,
* You need fine‑grained insights derived from message patterns,
* You want to track custom events without instrumenting code.

Examples of insights derived using logging-based metrics:

* Count of HTTP 5xx errors,
* Rate of failed authentication attempts,
* Number of timeouts or retries,
* Business metrics such as order failures.

Logging-based metrics bridge the gap between logs and metrics by producing numerical, queryable values from raw log entries.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Track infrastructure anomalies captured only in logs (e.g., disk errors),
* Convert system log patterns into actionable metrics,
* Trigger alarms using log-derived signals.

### Developers

* Extract metrics based on application log patterns,
* Track custom application behaviours (e.g., request failures),
* Feed log-derived data into dashboards for SLO monitoring.

### Unified View

```
Logs → Extract Patterns → Convert to Metric → Dashboards / Alerts / SLO Monitoring
```

---

# 3. Key Concepts

## 3.1 Log Sources

OCI Logging can ingest logs from:

* Compute instance log files,
* OCI service logs,
* Application logs,
* Custom file paths using Cloud Agent.

---

## 3.2 Logging Query Language (LQL)

A structured format to filter, parse, and aggregate log events.

Common operations:

* `filter` – select log lines,
* `parse` – extract fields from log entries,
* `stats` – compute numerical values.

Example:

```
filter httpStatus >= 500
| stats count() as errorCount by bin(1m)
```

---

## 3.3 Metric Extraction

After constructing a query, you create a metric from it:

* Metric updates automatically based on new logs,
* Metric appears under namespace: `oci_logging` or a custom namespace.

---

# 4. Real-World Examples

### Example 1 — API Error Count

Logs contain 5xx entries:

```
2025-11-14 12:01:05 ERROR /checkout 502 Bad Gateway
```

Logging-based metric counts occurrences per minute.

### Example 2 — Authentication Failures

Security logs show repeated login failures.
Metric can track:

* Failed logins per minute,
* Trigger alerts for brute-force attempts.

### Example 3 — Disk Warning Messages

System logs contain:

```
WARNING: disk sda running out of space
```

Metric extracted to count warnings → alarm triggers before outage.

---

# 5. Case Study

### Scenario: Error Spikes Causing SLO Violations

Checkout service logs produce entries:

```
ERROR checkout_failed orderId=123 reason=timeout
```

SRE creates a logging-based metric:

```
filter logLevel = "ERROR" and message contains "checkout_failed"
| stats count() by bin(1m)
```

### Results

* Error spikes visible on dashboards,
* Alarm triggers when error rate exceeds threshold,
* Faster detection reduces impact duration.

---

# 6. Hands-On Exercise (Summary Only)

A full hands-on lab will follow separately.
It will include:

* Creating a logging query,
* Extracting fields using parse,
* Creating a logging-based metric,
* Plotting the metric in a dashboard.

---

# 7. Architecture / Workflow Diagrams

### Diagram 1 — Log to Metric Pipeline

```
Logs → LQL Query → Stats Aggregation → Metric → Alerts & Dashboards
```

### Diagram 2 — Example SLO Alignment

```
SLO: Error rate < 0.3%
Metric: log-derived errorCount
Dashboard: P99 latency + errorCount
Alarm: errorCount > threshold
```

### Diagram 3 — Log Query Flow

```
Raw Logs → Filter → Parse → Stats → Metric Output
```

---

# 8. Best Practices

* Use structured JSON logs where possible,
* Keep log-based queries efficient,
* Avoid unnecessary parsing when simple filters work,
* Use `bin()` for consistent time buckets,
* Validate metrics before connecting alarms.

---

# 9. Common Mistakes

* Creating overly complex log queries,
* Parsing unstructured logs unnecessarily,
* Forgetting to set correct compartments or log groups,
* Not verifying field names when parsing JSON logs.

---

# 10. Checklist

* Identify log patterns needing metric extraction,
* Write and test LQL queries,
* Confirm metrics appear under correct namespace,
* Add metrics to dashboards,
* Optionally connect alarms.

---

# 11. Additional Notes

* Logging-based metrics are essential for monitoring application-level behaviours.
* They complement default OCI metrics and improve SLO visibility.
