# Day 2 – Measuring Reliability and Monitoring on OCI

## Subtopic: OCI Monitoring Basics

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → OCI Monitoring Basics

### Audience Context: IT Engineers and Developers

---

## 1. Concept Overview

OCI Monitoring is the foundational service that collects, stores, and visualizes **metrics** from OCI resources and custom applications. For SRE, IT engineers, and developers, Monitoring provides the raw data used for:

* SLIs (latency, availability, errors)
* SLO evaluations
* Error budget burn
* Infrastructure diagnostics
* Automated alerting

Key points:

* Monitoring ingests metrics from every major OCI service.
* Metrics are stored in time-series format.
* Data can be queried through **Metric Explorer**, APIs, and dashboards.
* Alarms can be built directly on top of Monitoring.

This subtopic focuses on how metrics are organized, where they come from, and how engineers should interpret them.

---

## 2. How This Applies to IT Engineers and Developers

### IT Engineers

* View compute, network, and load balancer performance.
* Use default metrics for capacity and troubleshooting.
* Integrate metrics into observability and alerting systems.

### Developers

* Interpret application-level performance (latency, success rates, throughput).
* Use custom metrics to track code paths.
* Understand how their application behaviour appears in Monitoring.

### Unified View

```
Resource / App → Emits Metrics → OCI Monitoring → SLIs / Alerts / Dashboards
```

---

## 3. Key Concepts

## 3.1 Metric Namespace

A namespace groups metrics belonging to a specific OCI service.

Examples:

```
oci_computeagent
oci_computeapi
oci_vcn
oci_lbaas
oci_blockstore
```

Developers can define custom namespaces such as:

```
custom.myapp
```

---

## 3.2 Metric Names

Each namespace contains metric names describing a behaviour.

Examples:

```
CpuUtilization
MemoryUtilization
NetworkBytesIn
HttpResponseCounts
BackendResponseTime
DiskUsedPercent
```

---

## 3.3 Dimensions

Dimensions are key-value pairs attached to metrics, allowing filtering.

Examples:

```
resourceId
availabilityDomain
instancePoolId
backendSetName
```

---

## 3.4 Statistics

Monitoring supports:

* count
* max
* mean
* min
* sum
* percentile (P90, P95, P99)

Percentiles are essential for latency SLIs.

---

## 3.5 Default vs Custom Metrics

### Default Metrics

Automatically emitted by OCI services.

### Custom Metrics

Developers push custom application metrics using:

* OCI SDKs
* OCI CLI
* REST API
* Monitoring ingestion endpoints

Custom metrics are used for business logic, feature-level behaviour, or application-specific SLIs.

---

## 4. Real-World Examples

### Example 1 — CPU Saturation on Compute

IT engineers monitor CPUUtilization to identify application overload patterns.

### Example 2 — LB Backend Latency Watching for Spikes

SRE monitors BackendResponseTime for SLO compliance.

### Example 3 — Payment API Custom Metric

Developers send a custom metric:

```
custom.myapp.payment.failureRate
```

Used to track reliability of external dependency.

---

## 5. Case Study

### Scenario: Slowdown Reported in Production

Users report slow responses during peak traffic.

### Investigation

1. SRE opens Metric Explorer.
2. Queries LB metrics → high BackendResponseTime.
3. Queries compute metrics → CPUUtilization spikes.
4. Developers review logs → long DB wait times.

### Result

* Compute shape upgraded.
* DB query optimized.
* SLO now stable.

---

## 6. Hands-On Exercise (Summary Only)

A complete hands-on lab will follow after this theory document.
The lab will include:

* Enabling metrics for Compute instances.
* Inspecting available metric names.
* Querying default metrics.
* Viewing dimensions and filtering.

---

## 7. Architecture / Workflow Diagrams

### Diagram 1 — Metric Flow

```
OCI Resource / App
       |
       v
   Time-Series Metrics
       |
       v
   OCI Monitoring → Metric Explorer → Dashboards / Alarms
```

### Diagram 2 — Metric Components

```
Metric Namespace → Metric Name → Dimensions → Statistic → Data Point
```

### Diagram 3 — Example Metric Query

```
Namespace: oci_lbaas
Metric: BackendResponseTime
Statistic: P99
Dimension: backendSetName = app-backend
```

---

## 8. Best Practices

* Use percentiles (p95/p99) for latency.
* Always tag custom metrics consistently.
* Avoid metric cardinality explosion.
* Keep SLI metrics simple and aligned to user experience.
* Validate metrics before defining SLOs or alarms.

---

## 9. Common Mistakes

* Using average latency instead of percentiles.
* Not enabling Cloud Agent → missing metrics.
* Filtering metrics incorrectly due to wrong dimensions.
* Too many custom metrics causing noise.

---

## 10. Checklist

* Understand metric namespaces.
* Know metric names relevant to your service.
* Identify correct dimensions.
* Use appropriate statistics.
* Verify that metrics represent user-facing behaviour.

---

## 11. Additional Notes

* OCI Monitoring integrates with Notifications for alerting.
* Custom metrics allow very detailed SLI tracking.
* The next subtopic focuses on Alarms and Notifications.
