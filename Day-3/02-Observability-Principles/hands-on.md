# Day 3 – Toil Reduction, Observability, and Automation

## Hands-On Lab: Observability Principles (Metrics, Logs, and Traces)

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Hands-On for Observability Principles

### Audience Context: IT Engineers and Developers

All steps follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab focuses on enabling observability signals — **metrics, logs, and traces** — for a Compute instance and application hosted on OCI.
By the end of this lab, participants will:

* Enable system logs for Compute,
* View logs in Log Explorer,
* Explore metrics already collected,
* Understand how these signals support troubleshooting and SLO analysis.

Traces are optional depending on whether tracing is enabled in the application.

---

# 2. Objectives

* Enable and validate system logs for a Compute instance.
* Explore application logs in Log Explorer.
* Review metrics in Metric Explorer.
* Understand how metrics, logs, and traces help diagnose issues.

---

# 3. Prerequisites

### OCI Requirements

* A running Compute instance.
* Cloud Agent enabled.
* Logging and Monitoring permissions.

### Knowledge Requirements

* Understanding of observability pillars (from theory).

---

# 4. Architecture / Diagram

```
Compute / Application
   |       |       |
   |       |       +--> Traces (optional)
   |       +-----------> Logs
   +--------------------> Metrics

Metrics + Logs + Traces → Observability → RCA / Troubleshooting
```

---

# 5. Step-by-Step Procedure

## Step 1: Verify Cloud Agent Plugins

1. Open OCI Console.
2. Navigate to **Compute → Instances**.
3. Select your instance.
4. On the left navigation pane, choose **Oracle Cloud Agent**.

Ensure the following plugins are **enabled**:

* Compute Instance Monitoring
* Management Agent
* Logging

If disabled:

* Click **Enable** → wait for plugin health to update.

---

## Step 2: Enable System Logs for Compute

1. In the instance page, go to **Resources → Logging**.
2. Click **Enable Logging**.
3. Select log types:

   * `/var/log/messages`
   * `/var/log/secure`
   * `/var/log/cloud-init.log`
4. Select a Log Group or create a new one.
5. Click **Enable**.

### Verify

* Logs start flowing within 1–2 minutes.

---

## Step 3: View System Logs in Log Explorer

1. Navigate to:
   **Observability & Management → Logging → Log Explorer**.
2. Select your Log Group.
3. Use filters:

   * Resource: your instance OCID
   * Log Type: system logs
4. View entries with timestamps.

### Observations

* System reboots
* SSH login events
* Service failures

---

## Step 4: Inspect Application Logs (If Available)

If your app writes logs to:

* `/var/log/app/*.log`
* `/usr/local/app/logs/`
* Custom log locations

Enable them similarly:

1. Navigate to the instance → **Logging**.
2. Add a new log.
3. Provide the log file path.
4. Store in the same Log Group.

---

## Step 5: Explore Metrics in Metric Explorer

1. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.

2. Review available namespaces:

   * `oci_computeagent`
   * `oci_computeapi`
   * `oci_blockstore`
   * `oci_lbaas` (if LB exists)

3. Select metrics such as:

   * `CpuUtilization`
   * `MemoryUtilization`
   * `NetworkBytesIn`
   * `NetworkBytesOut`

### Apply Filters

* Dimension: `resourceId`
* Choose your instance.

### Switch Statistics

* mean
* max
* p95/p99 (for latency metrics only)

---

## Step 6: Perform Correlation Exercise

Use logs and metrics together:

### Scenario Example

During a test, you generate CPU load:

1. Run on instance:

```
sudo dnf install -y stress-ng
sudo stress-ng --cpu 4 --timeout 60
```

2. In Metric Explorer, observe CPUUtilization increase.
3. In Log Explorer, observe system logs during spike.

### Outcome

This helps understand how metrics + logs together support root-cause analysis.

---

## Step 7: (Optional) Explore Traces if Application Supports It

If your application sends traces via OTEL or any tracing library:

* Navigate to **Observability → Application Performance Monitoring**.
* View service map.
* Inspect trace spans for slow requests.

If tracing is not enabled, skip this step.

---

# 6. Expected Output / Verification

You should be able to:

* View system logs from the Compute instance.
* Filter and analyze logs based on timestamp and event type.
* Query system metrics via Metric Explorer.
* Correlate logs and metrics during resource activity.
* (Optional) View traces if enabled.

Verification Checklist:

```
[ ] Cloud Agent plugins enabled
[ ] System logs visible in Log Explorer
[ ] Application logs visible (if applicable)
[ ] Metrics queryable in Metric Explorer
[ ] Logs and metrics correlation observed
```

---

# 7. Troubleshooting Guidelines

**Logs not visible:**

* Ensure correct Log Group selected.
* Confirm file-based logging path.
* Check Cloud Agent log plugin status.

**Metrics missing:**

* Ensure instance is running.
* Verify compute monitoring plugin.
* Confirm namespace selection.

**Traces not visible:**

* Application tracing might not be enabled.
* Verify APM or external tracing setup.

---

# 8. Best Practices Learned

* Always enable system logs for production workloads.
* Use structured logs with consistent fields.
* Use percentiles to understand outliers.
* Correlate metrics + logs to identify root causes.
* Use tracing for distributed or microservices architectures.

---

# 9. Additional Notes

* Tracing is optional but highly beneficial for distributed apps.
* This lab prepares you for Subtopic 3 (Logging-Based Metrics).
