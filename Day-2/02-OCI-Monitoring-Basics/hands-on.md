# Day 2 – Measuring Reliability and Monitoring on OCI

## Hands-On Lab: OCI Monitoring Basics

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → Hands-On for OCI Monitoring Basics

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab teaches how to explore and validate OCI Monitoring metrics for Compute instances and other core services.
The goal is to help participants:

* Enable compute metrics (if needed)
* Navigate the Monitoring interface
* Inspect metric namespaces and metric names
* Understand how to use these metrics for SLIs and SLOs

Monitoring is the foundation for reliability measurement, so engineers must know exactly where signals come from and how to query them.

---

# 2. Objectives

* Enable and verify Compute instance metrics.
* Explore Monitoring → Metric Explorer.
* Identify available namespaces and metric names.
* Inspect dimensions and statistics.
* Validate metric availability for future SLO/alerting use.

---

# 3. Prerequisites

### OCI Requirements

* Compute instance (VM or Bare Metal) in RUNNING state.
* Cloud Agent enabled for enhanced metrics.
* IAM permissions for:

  * Monitoring
  * Compute
  * Logging (optional for deeper checks)

### Knowledge Requirements

* Basic understanding of metrics.
* Awareness of compute and network behaviour.

---

# 4. Architecture / Diagram

```
   Compute Instance
        |
        |  (Resource metrics emitted automatically)
        v
   OCI Monitoring Service
        |
        v
   Metric Explorer → Dashboards / Alarms
```

---

# 5. Step-by-Step Procedure

## Step 1: Verify Compute Metrics Availability

1. Open OCI Console.
2. Navigate to **Compute → Instances**.
3. Select your instance.
4. Open the **Metrics** tab.

### Verify:

* CPUUtilization is visible.
* MemoryUtilization appears (requires Cloud Agent).
* NetworkBytesIn / Out graphs appear.

If metrics are missing:

* Scroll to **Instance Details → Management Agent**.
* Ensure agent status = **Active**.

---

## Step 2: Check and Enable Cloud Agent (If Required)

1. In the instance page, select **Oracle Cloud Agent** in the left panel under "Resources".
2. Enable the following plugins:

   * Compute Instance Monitoring
   * Management Agent
   * Logging
3. Click **Enable** if plugins are inactive.
4. Wait 2–3 minutes for metrics to populate.

---

## Step 3: Explore Metric Explorer

1. Open the navigation menu.
2. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.
3. In the **Metric Namespace** dropdown, examine the available namespaces.

Common namespaces include:

```
oci_computeagent
oci_computeapi
oci_vcn
oci_lbaas
oci_blockstore
```

---

## Step 4: Inspect Metric Names

1. Select namespace **oci_computeagent**.

2. Review available metric names:

   * CpuUtilization
   * MemoryUtilization
   * NetworkBytesIn
   * NetworkBytesOut
   * DiskBytesRead
   * DiskBytesWritten

3. Select namespace **oci_computeapi**.

4. Review metric names for system-level behaviours:

   * CpuUtilization
   * DiskUsedPercent

### Note

Not all metrics come from cloud agent. Some are native.

---

## Step 5: Apply Dimensions and Filters

1. Select **CpuUtilization**.
2. Under Dimensions, locate:

   * resourceId → Instance OCID
   * availabilityDomain
3. Select your instance OCID.
4. Click **Update Chart** to refresh.

### Verify

* Graph updates to show only your instance metrics.

---

## Step 6: Inspect Statistics

Using **CpuUtilization**:

1. Change Statistic from **mean** to:

   * max
   * min
   * p90
   * p95
2. Observe differences.

### Why

Percentiles show tail latency or extreme load patterns.

---

## Step 7: Inspect Metric Metadata

1. In Metric Explorer, click **Show Advanced**.
2. Review:

   * Interval (1 min, 5 min, 1 hr)
   * Aggregation methods
   * Default retention period

This helps SRE understand metric accuracy for SLO computations.

---

## Step 8: Validate Custom Metrics Support (Optional)

1. In namespaces dropdown, search for any prefix such as:

```
custom.
```

2. If available, expand and inspect.

### Why

Developers may choose to instrument code for SLI-aligned metrics.

---

# 6. Expected Output / Verification

You should be able to confirm:

* Compute instance shows CPU, memory, and network metrics.
* Cloud Agent plugins are enabled.
* Metric Explorer returns compute metrics.
* Multiple namespaces are visible.
* Able to filter metrics by instance OCID.
* Able to switch statistics successfully.

Verification checklist:

```
[ ] Compute metrics visible
[ ] Metric namespaces identified
[ ] Dimensions applied correctly
[ ] Percentile statistics used
```

---

# 7. Troubleshooting Guidelines

**Metrics not visible:**

* Enable Cloud Agent plugins.
* Ensure instance is RUNNING.
* Switch compartments in Metric Explorer.

**No matching namespace:**

* Select correct region.
* Expand list fully; names may appear lower alphabetically.

**Filtering issues:**

* Clear filters.
* Re-select instance OCID.
* Ensure correct time window selected.

---

# 8. Best Practices Learned

* Always verify Cloud Agent plugins when metrics seem missing.
* Use p95/p99 metrics instead of averages.
* Naming and tagging for custom metrics must be consistent.
* Keep SLI-related metrics minimal and meaningful.

---

# 9. Additional Notes

* These learned skills will be used in the next subtopic: **Alarms and Notifications**.
