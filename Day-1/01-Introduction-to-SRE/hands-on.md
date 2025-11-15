# Day 1 – SRE Fundamentals and OCI Foundations

## Hands-On Lab: Introduction to SRE

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → Hands-On for Introduction to SRE

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab enables IT engineers and developers to understand how reliability signals are produced, collected, and interpreted within Oracle Cloud Infrastructure (OCI). It demonstrates how compute metrics, logs, network behaviour, and system events serve as inputs for SRE practices such as observability, incident detection, and reliability engineering.

The purpose is to learn **where reliability signals originate**, how to **interpret them**, and how to **correlate them** with application and system behaviour.

---

# 2. Objectives

* Identify and interpret system metrics from OCI Compute resources.
* Access and analyse OCI Logging for system, network, and application signals.
* Use OCI Monitoring (Metric Explorer) to query and examine live service metrics.
* Understand how developers and IT engineers correlate logs and metrics.
* Understand the relationship between observed behaviour and reliability engineering.

---

# 3. Prerequisites

### OCI Requirements

* Active OCI tenancy.
* Access permissions for:

  * Compute
  * Virtual Cloud Networks (VCN)
  * Logging
  * Monitoring
  * IAM view-level permissions

### Environment Requirements

* At least **one running compute instance** in a compartment you can access.
* Instance must have **OCI Cloud Agent** enabled to view advanced metrics.

### Knowledge Requirements

* Basic Linux command-line familiarity.
* Understanding of common application logs.
* Understanding of fundamental cloud concepts.

---

# 4. Architecture / Diagram

The lab uses a standard environment where compute instances generate system metrics and logs, which are collected by OCI Logging and Monitoring.

```
                         +---------------------------+
                         |         End Users         |
                         +-------------+-------------+
                                       |
                                       v
                            +---------------------+
                            |    OCI Load Balancer|
                            +-----------+---------+
                                        |
                        +---------------+----------------+
                        |                                |
                        v                                v
             +-------------------+             +-------------------+
             |   Compute VM 1    |             |   Compute VM 2    |
             +---------+---------+             +---------+---------+
                       |                               |
                       v                               v
         +------------------------+     +------------------------+
         | Application & System   |     | Application & System   |
         | Logs / Metrics / Events|     | Logs / Metrics / Events|
         +-----------+------------+     +-----------+------------+
                     |                              |
                     +------------------------------+
                                   |
                                   v
                        +-------------------------+
                        | OCI Monitoring & Logging|
                        +-------------------------+
```

---

# 5. Step-by-Step Procedure

## Step 1: Verify Compute Instance Status and Access

1. Log in to OCI Console.
2. Open the navigation menu.
3. Go to:
   **Compute → Instances**.
4. Select your compute instance.
5. Confirm the following:

   * Instance **State** is *Running*.
   * Instance details page loads without errors.

### Why This Matters

Verifying the base health of the instance ensures metrics and logs will populate correctly.

---

## Step 2: View Compute Metrics (Latest OCI UI)

1. In the instance page, scroll to the **Resources** section.
2. Select **Metrics**.
3. Review available charts such as:

   * `CpuUtilization`
   * `MemoryUtilization` (requires Cloud Agent)
   * `NetworkBytesIn`
   * `NetworkBytesOut`
   * `DiskBytesRead`
   * `DiskBytesWritten`
4. Hover over graphs to view precise timestamps and values.

### Why This Matters

These metrics show how the system behaves under real load, directly influenced by application behaviour.

---

## Step 3: Review System and Application Logs

1. Open the navigation menu.
2. Go to:
   **Observability & Management → Logging → Log Explorer**.
3. In the Filters panel:

   * Select your **Compartment**.
   * Select **Log Group** containing instance logs.
4. Choose logs such as:

   * **Instance Console Logs**
   * **Custom Application Logs** (if configured)
   * **VCN Flow Logs** (if enabled on subnet)

### Observations

* Identify log patterns, timestamps, and error entries.
* Developers use these to identify application-level failures.
* IT engineers use these to diagnose system-level and network issues.

---

## Step 4: Query Metrics Using Metric Explorer

1. Open the navigation menu.
2. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.
3. In the **Metric Namespace** dropdown, choose:

   * `oci_computeagent`
   * `oci_computeapi`
   * `oci_lbaas` (for load balancer metrics)
4. Choose metrics such as:

   * `CpuUtilization`
   * `FilesystemUsage`
   * `BackendHealthyHostCount`
5. Apply filters such as:

   * Instance OCID
   * Resource group
6. Click **Update Chart**.

### Why This Matters

Metric Explorer provides granular historical and real-time visibility essential for SRE analysis.

---

## Step 5: Examine Network Path and Dependencies

1. Open the navigation menu.
2. Go to:
   **Networking → Virtual Cloud Networks**.
3. Select the VCN hosting your instance.
4. Inspect:

   * **Subnets** → verify private/public subnet assignment.
   * **Route Tables** → confirm outbound path.
   * **Security Lists** → inspect ingress/egress rules.
   * **Gateways** → note use of Internet Gateway or NAT.

### Why This Matters

Understanding the network path ensures you can identify routing, firewall, or dependency issues.

---

## Step 6: Correlate Metrics and Logs

1. Note a timestamp where CPU, memory, or network usage spikes.
2. Return to Log Explorer.
3. Filter logs for the **same timestamp range**.
4. Identify correlations between:

   * High resource usage
   * Application errors
   * Network drops

### Why This Matters

Correlation provides the foundation for incident investigation and SRE root cause analysis.

---

# 6. Expected Output / Verification

A successful lab completion demonstrates the following:

* Ability to view compute instance metrics.
* Ability to locate logs for system, network, and application layers.
* Understanding of how metrics reflect system stress or behaviour.
* Ability to correlate logs and metrics for incident detection.
* Clear mapping between application behaviour and reliability signals.

Verification checks:

* CPU, memory, and network metrics show meaningful data.
* Log Explorer shows recent logs within the last 10 minutes.
* Metric Explorer displays at least one valid chart.
* Network configuration can be traced end-to-end.

---

# 7. Troubleshooting Guidelines

**Metrics missing:**

* Ensure instance has the **OCI Cloud Agent** enabled.
* Restart the management agent if needed.
* Check IAM permissions.

**Logs not visible:**

* Confirm the correct compartment and log group.
* Ensure logging is enabled for the instance or subnet.

**Network visibility unclear:**

* Check compartment filter.
* Ensure correct VCN is selected.

**High CPU but no errors found:**

* Review OS-level logs to identify background processes.
* Check application thread pool configuration.

---

# 8. Best Practices Learned

* Always verify instance agent status for complete metrics.
* Maintain structured logs to simplify filtering.
* Build metric dashboards around user-impacting indicators.
* Document network and routing dependencies.
* Use correlation to diagnose performance degradations.

---

# 9. Additional Notes

* This lab provides foundational observability understanding required for future labs involving SLIs, SLOs, alerts, and reliability automation.
* Accurate interpretation of signals is essential before engaging in deeper SRE practices.
