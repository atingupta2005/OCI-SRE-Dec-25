# Day 2 – Designing and Implementing Reliability Measures

## Hands-On Lab: Designing SLIs and SLOs

### TOC Reference: Day 2 → Designing SLIs & SLOs → Hands-On for Designing SLIs and SLOs

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab enables participants to design **Service Level Indicators (SLIs)** and **Service Level Objectives (SLOs)** using real signals from an OCI-based application. The goal is to translate user-facing behaviours into measurable reliability criteria.

By the end of this lab, engineers will:

* Map user journeys to measurable points.
* Identify candidate SLIs.
* Extract latency and availability metrics from OCI Monitoring.
* Define realistic SLOs.
* Calculate error budgets.

This is a modelling exercise using your existing application running behind an OCI load balancer.

---

# 2. Objectives

* Analyse user flows and critical request paths.
* Identify meaningful SLIs based on Monitoring metrics.
* Set appropriate SLO targets.
* Calculate monthly error budgets.
* Validate measurability by checking actual OCI signals.

---

# 3. Prerequisites

### OCI Requirements

* Application deployed behind an OCI Load Balancer.
* Compute instances with Cloud Agent enabled.
* Logging & Monitoring enabled.
* IAM permissions for:

  * Load Balancers
  * Monitoring
  * Logging
  * Compute

### Knowledge Requirements

* Familiarity with request/response patterns.
* Understanding of percentiles (P95/P99).

---

# 4. Architecture / Diagram

```
User → OCI Load Balancer → Application VMs → Database / External APIs
                               |                 |
                               |                 +→ System Metrics
                               +→ LB Metrics
                                   +→ Logs
```

SLIs will be derived from this path.

---

# 5. Step-by-Step Procedure

## Step 1: Identify Critical User Journeys

1. List your application's top operations (e.g., login, checkout, search).
2. Prioritise operations with high business impact.
3. Select **one primary path** for this lab. Example:

```
User → LB → /api/checkout → Database
```

### Reasoning

SLIs should measure the most important user-facing behaviours.

---

## Step 2: Identify Candidate SLIs Using OCI Monitoring

1. Open OCI Console.
2. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.
3. In **Metric Namespace**, select:

   * `oci_lbaas`
4. Query the following key metrics:

   * `BackendResponseTime` → Latency SLI
   * `HttpResponseCounts` → Success Rate SLI
   * `BackendHealthyHostCount` → Availability SLI

### Extracting Latency Data

1. Select metric: **BackendResponseTime**.
2. Filter resources by your load balancer OCID.
3. Change the statistic to **p95** or **p99**.

### Extracting Success Rate Data

1. Select metric: **HttpResponseCounts**.
2. Filter by HTTP class codes:

   * `2xx`
   * `4xx`
   * `5xx`

### Extracting Availability Data

* Review `BackendHealthyHostCount` to measure host readiness.

---

## Step 3: Finalise SLIs

Based on extracted metrics, define SLIs.

Example SLIs:

```
SLI 1: P99 latency of /api/checkout
SLI 2: Percentage of requests returning 2xx
SLI 3: Healthy backend availability
```

Write them in your notes/document.

---

## Step 4: Define SLO Targets

Use the last 7–30 days of monitoring data.

1. Review historical latency (p99) trends.
2. Identify typical patterns during peak load.
3. Set an achievable target.

### Example SLOs

```
SLO 1: P99 latency < 600 ms for /api/checkout
SLO 2: 99.7% of all requests return 2xx
SLO 3: At least 1 healthy backend 99.9% of the time
```

### Notes

* Avoid extreme values without historical proof.
* SLO is not a wish; it's a commitment.

---

## Step 5: Calculate Error Budgets

Formula:

```
Error Budget = 100% - SLO
```

### Example Calculation

```
If SLO = 99.7% → Error Budget = 0.3%
```

If service receives 5 million monthly requests:

```
Allowed failures = 5,000,000 * 0.3% = 15,000 failed requests
```

Record this value for later error budget burn analysis.

---

## Step 6: Validate SLIs in the Real Metrics

1. Return to **Metric Explorer**.
2. Validate that the metric streams exist for:

   * Latency (p95/p99)
   * Success rate components (response counts)
   * Availability (healthy host count)
3. Ensure metrics update when traffic is generated.

### Important Check

SLIs must be **observable** before they can be used.

---

## Step 7: Document SLIs, SLOs, and Error Budgets

Create a table similar to below:

```
+----------------------+-----------------------+----------------------------+
|      SLI Name        | SLO Target            | Monthly Error Budget       |
+----------------------+-----------------------+----------------------------+
| P99 Checkout Latency | < 600ms               | 121,000ms allowed latency  |
| Success Rate         | 99.7%                 | 15,000 failed requests     |
| Healthy Backend      | 99.9%                 | 43 minutes downtime        |
+----------------------+-----------------------+----------------------------+
```

---

# 6. Expected Output / Verification

By completing this lab, participants should be able to:

* Identify critical user-facing metrics.
* Derive SLIs based on Monitoring signals.
* Set realistic SLOs.
* Calculate numerical error budgets.
* Validate that chosen SLIs are measurable.

Verification checklist:

```
[ ] Able to query p95/p99 latency
[ ] Able to calculate success rate from response counts
[ ] Able to compute error budget
[ ] Able to confirm availability metrics
```

---

# 7. Troubleshooting Guidelines

**Missing metrics:**

* Ensure the load balancer receives traffic.
* Verify correct compartment is selected.
* Check that Cloud Agent is enabled on compute instances.

**Too much noise in data:**

* Use filtering or longer time ranges.
* Switch to p99 for high traffic systems.

**SLI not measurable:**

* Ensure correct metric namespace is used.
* Confirm resource OCIDs match your LB.

**Latency spikes unexplained:**

* Check compute CPU saturation.
* Check database latency.
* Review logs for backend timeouts.

---

# 8. Best Practices Learned

* Select user-centric SLIs, not internal-only metrics.
* SLOs must reflect real system performance.
* Error budgets guide release velocity.
* SLI measurability is essential before adopting.

---

# 9. Additional Notes

* These SLIs and SLOs will be used in upcoming labs for alerting and release gating.
* Over time, refine SLOs based on production maturity.
