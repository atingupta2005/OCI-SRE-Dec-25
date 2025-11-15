# Day 1 – SRE Fundamentals and OCI Foundations

## Hands-On Lab: SLIs, SLOs, and Error Budgets

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → Hands-On for SLIs, SLOs, Error Budgets

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab helps IT engineers and developers **practically define SLIs, set SLOs, and calculate error budgets** using real OCI metrics. By working directly with monitoring data, participants understand how reliability becomes measurable and actionable.

This lab uses an OCI web application or sample API running behind a load balancer. You will inspect its performance and derive reliability metrics based on real signals such as:

* Latency
* Success rate
* Unhealthy backend count
* Throughput

---

# 2. Objectives

* Identify and extract SLIs from OCI Monitoring.
* Define realistic SLOs based on observed behaviour.
* Calculate the error budget for an SLO.
* Understand error budget burn and its impact on releases.
* Practically correlate user-facing behaviour with system metrics.

---

# 3. Prerequisites

### OCI Requirements

* Running application behind an OCI Load Balancer.
* Compute instances with Cloud Agent enabled.
* Logging and Monitoring enabled.
* Permissions for:

  * Monitoring (view metrics)
  * Logging (view logs)
  * Compute (view instances)
  * Load Balancers (view backend status)

### Knowledge Requirements

* Basic understanding of latency, throughput, and error codes.
* Familiarity with Metric Explorer.

---

# 4. Architecture / Diagram

```
                +---------------------------+
                |         End Users         |
                +-------------+-------------+
                              |
                              v
                      +---------------+
                      | OCI Load Bal. |
                      +-------+-------+
                              |
                   +----------+----------+
                   |                     |
                   v                     v
             [Compute VM 1]       [Compute VM 2]
                   |                     |
                   +----------+----------+
                              |
                              v
                     OCI Monitoring
                              |
                              v
                   SLI → SLO → Error Budget
```

---

# 5. Step-by-Step Procedure

## Step 1: Identify the Service and Its Critical Paths

1. Open OCI Console.
2. Navigate to:
   **Networking → Load Balancers**.
3. Select the load balancer for your application.
4. Identify:

   * Backend Set Name
   * Listener (port 80/443)
   * Associated instance pool

### Observation

This establishes the user-facing surface through which SLIs will be measured.

---

## Step 2: Identify Candidate SLIs Using Metric Explorer

1. Open the navigation menu.
2. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.
3. In **Metric Namespace**, select:

   * `oci_lbaas`
4. Review metrics such as:

   * `BackendHealthyHostCount`
   * `BackendResponseTime`
   * `HttpResponseCounts`
   * `BackendConnectionErrors`

### Capture Latency SLI

* Select `BackendResponseTime`.
* Filter using the load balancer OCID.
* Switch Statistic to **p95** or **p99**.

### Capture Availability SLI

* Query `HttpResponseCounts`.
* Filter by response code class (2xx, 5xx, timeout).

---

## Step 3: Define SLIs

Document the SLIs you will use based on observed data.

Example:

```
SLI 1: P99 latency for load balancer backend responses.
SLI 2: Percentage of successful (2xx) responses.
SLI 3: Healthy backend host count.
```

---

## Step 4: Set SLO Targets

Use observed behaviour to define realistic targets. Avoid overly strict thresholds, especially without historical data.

Examples:

```
SLO 1: P99 latency < 450 ms over a 30-day window.
SLO 2: 99.9% of all requests must return 2xx.
SLO 3: At least 1 healthy backend must remain available at all times.
```

Recommended process:

1. Review past 7 days of metric history.
2. Identify the 95th percentile and 99th percentile latency.
3. Select an SLO slightly above typical P99.

---

## Step 5: Calculate the Error Budget

Error budget formula:

```
Error Budget = 100% - SLO target
```

Example SLO:

```
99.9% success rate
```

```
Error Budget = 100% - 99.9% = 0.1%
```

If your service receives **10 million requests per month**, allowable failed requests:

```
10,000,000 * 0.1% = 10,000 failed requests allowed.
```

---

## Step 6: Observe Error Budget Burn

Using **Metric Explorer**:

1. Query `HttpResponseCounts`.
2. Filter 5xx and timeout responses.
3. Compare number of failed responses to error budget.

### Example Interpretation

* If 8,000 errors occur early in the month and error budget allows 10,000 → aggressive burn.
* SRE would trigger **release freeze** and prioritise remediation.

---

## Step 7: Correlate Logs with SLO Compliance

1. Navigate to:
   **Observability & Management → Logging → Log Explorer**.
2. Filter by:

   * Load balancer access logs
   * Application logs
3. Match timestamps where:

   * Latency spikes
   * Error rates increase

### Observations

* Developers identify code-level triggers.
* IT engineers identify resource saturation or network issues.
* SRE determines SLO impact.

---

# 6. Expected Output / Verification

By completing this lab you should be able to:

* Identify latency, availability, and health SLIs.
* Extract metrics from OCI Monitoring.
* Define practical SLO targets based on observed data.
* Calculate error budgets accurately.
* Detect and interpret error budget burn.
* Use logs to explain reliability degradation.

Verification checklist:

* Able to query `BackendResponseTime` with p95/p99 statistics.
* Able to derive success/failure rates from `HttpResponseCounts`.
* Able to calculate error budget from SLO target.
* Able to correlate logs with metric anomalies.

---

# 7. Troubleshooting Guidelines

**Metrics missing:**

* Ensure load balancer is actively receiving traffic.
* Check the correct metric namespace.

**No latency data:**

* Ensure the backend is reachable.
* Verify health check configuration.

**Error budget calculations seem incorrect:**

* Validate time window consistency.
* Check for traffic bursts or noise.

**Logs do not align with metrics:**

* Confirm correct compartment and log group.
* Ensure timestamps are synchronised.

---

# 8. Best Practices Learned

* Always use user-impacting SLIs, not internal technical metrics.
* Choose realistic SLOs based on past performance.
* Treat error budgets as a shared engineering contract.
* Incorporate SLO checks into deployment pipelines.
* Analyse burn rate regularly, not only during incidents.

---

# 9. Additional Notes

* This lab introduces the quantitative foundation for future SRE practices.
* Later labs will include automated alerting, SLO dashboards, and error-budget-based deployment gating.
