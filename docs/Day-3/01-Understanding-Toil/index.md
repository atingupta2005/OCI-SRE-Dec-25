# Day 3 – Toil Reduction, Observability, and Automation

## Hands-On Lab: Building Dashboards and Visualization

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → Hands-On for Dashboards and Visualization

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

## 1. Background and Purpose

Dashboards are a core SRE tool used for:

* Visualizing SLIs
* Tracking SLO compliance
* Monitoring real-time resource behaviour
* Observing ongoing incidents
* Supporting on-call troubleshooting

This hands-on lab teaches participants how to build an OCI dashboard focused on latency, availability, and error indicators using real metrics from Compute instances and Load Balancers.

---

## 2. Objectives

* Create an OCI custom dashboard.
* Add latency, CPU, and network metric charts.
* Add error-rate visualizations.
* Add alarm widgets for quick incident awareness.
* Organize panels to reflect the application’s architecture.

---

## 3. Prerequisites

### OCI Requirements

* Compute instance with Cloud Agent enabled.
* Load balancer (optional but recommended).
* Monitoring and Dashboard permissions: `monitoring.*` and `dashboard.*`.

### Knowledge Requirements

* Ability to query metrics in Metric Explorer.
* Understanding of P95/P99 latency concepts.

---

## 4. Architecture / Diagram

```
             +-----------------------------+
             |      OCI Custom Dashboard   |
             +-----------------------------+
             |  Latency (P95/P99)          |
             |  Error Rate                 |
             |  Healthy Backends           |
             |  CPU / Memory / Network     |
             |  Alarm States               |
             +-----------------------------+
```

---

## 5. Step-by-Step Procedure

## Step 1: Create a New Dashboard

1. Open OCI Console.
2. Navigate to:
   **Observability & Management → Dashboards**.
3. Click **Create Dashboard**.
4. Provide:

   * Name: `day2-reliability-dashboard`
   * Description: `Dashboard for SLI/SLO reliability metrics`
5. Select **Create**.

---

## Step 2: Add a Latency Panel (Load Balancer)

### For environments with an OCI Load Balancer:

1. Click **Add Widget → Metric Chart**.
2. Choose:

   * Namespace: `oci_lbaas`
   * Metric: `BackendResponseTime`
3. Under **Statistic**, select: `p99`.
4. Filter dimensions:

   * `backendSetName`: your backend set
   * `resourceId`: your load balancer OCID
5. Title the panel: `P99 Backend Latency`.
6. Click **Add to Dashboard**.

---

## Step 3: Add CPU Utilization Panel

1. Click **Add Widget → Metric Chart**.
2. Select:

   * Namespace: `oci_computeagent`
   * Metric: `CpuUtilization`
3. Filter by instance OCID.
4. Choose statistic: `mean`.
5. Title: `Compute CPU Utilization`.
6. Add widget.

---

## Step 4: Add Memory Utilization Panel

1. Add another **Metric Chart**.
2. Namespace: `oci_computeagent`
3. Metric: `MemoryUtilization`.
4. Filter by instance OCID.
5. Title: `Memory Utilization`.

### Notes

Memory metrics require Cloud Agent.

---

## Step 5: Add Error Rate Panel (Load Balancer)

1. Add **Metric Chart**.
2. Namespace: `oci_lbaas`.
3. Metric: `HttpResponseCounts`.
4. Filter dimensions:

   * HTTP response class = `5xx`
5. Choose statistic: `sum`.
6. Title: `Error Rate (5xx Responses)`.

---

## Step 6: Add Healthy Backend Count Panel

1. Add **Metric Chart**.
2. Namespace: `oci_lbaas`.
3. Metric: `BackendHealthyHostCount`.
4. Title: `Healthy Backend Hosts`.
5. Use statistic: `mean`.

### Why this matters

This panel quickly identifies LB-side failures.

---

## Step 7: Add Alarm Summary Widget

1. Click **Add Widget → Alarm Status**.
2. Select all relevant alarms:

   * CPU alarms
   * Latency alarms
   * Availability alarms
3. Title: `Active Alarms Overview`.

### Purpose

Provides quick visibility for on-call triage.

---

## Step 8: Organize Dashboard Layout

Arrange widgets in the following logical order:

```
Row 1: P99 Latency | Error Rate
Row 2: Healthy Backends | Alarm Status
Row 3: CPU Utilization | Memory Utilization | Network Traffic
```

Good dashboards follow the flow of the application:

* User-facing metrics on top
* Infrastructure metrics below
* Alerts on the side or near the top

---

## 6. Expected Output / Verification

Your dashboard should now include:

* A P99 latency chart
* Error rate visualization
* Backend health chart
* CPU and memory charts
* Alarm summary

Verification checklist:

```
[ ] Dashboard created successfully
[ ] Latency panel shows live data
[ ] CPU and memory metrics visible
[ ] Error panels show trend lines
[ ] Healthy backend count displayed
[ ] Alarms visible in summary widget
```

---

## 7. Troubleshooting Guidelines

**No metrics visible:

* Check correct region and compartment.
* Ensure Cloud Agent plugins are enabled on compute.

**Latency or error metrics missing:

* Verify load balancer is receiving traffic.

**Widget not saving:

* Ensure dashboard name does not contain unsupported characters.
* Refresh browser and retry.

**Alarm widget empty:

* Ensure alarms exist and are not disabled.

---

## 8. Best Practices Learned

* Group related metrics together.
* Visualize percentiles for latency, not averages.
* Include alarms to help on-call responders.
* Use consistent time windows (e.g., last 1 hour).
* Make dashboards service-centric, not resource-centric.

---

## 9. Additional Notes

* Dashboards will be reused in Day 4 for high-availability and failover validation exercises.
* Teams commonly create dashboards per microservice or per environment (dev, test, prod).
