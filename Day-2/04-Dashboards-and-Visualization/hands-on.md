# **Day 2 – Hands-On: Dashboards & Visualization (Using Class Enrollment App VM)**

## **Instructor-Optimized, Student-Friendly Version with Solutions Key**

In this lab, students will learn to build monitoring dashboards in OCI and create visual panels aligned with SRE practices. The focus is on **latency**, **uptime**, and **alarm awareness**, all tied to the Compute instance running the **Class Enrollment Web App**.

---

# **1. Objective of This Hands-On**

By the end of this exercise, students will:

* Understand how to create and organize an OCI Dashboard
* Build visual panels for latency and uptime metrics
* Add alarm widgets to unify alert visibility
* Interpret metrics in the context of reliability and SLOs

This is foundational for later topics: SLO validation, alert tuning, and incident review.

---

# **2. Background Before Hands-On**

Students should recall:

## **2.1 Dashboards Overview**

OCI Dashboards allow you to visualize:

* Compute metrics (CPU, memory, network)
* Custom metrics (latency, errors, business KPIs)
* Alarms firing states
* Logs & traces (via widgets)

Dashboards help SREs:

* Validate SLO performance
* Spot patterns and anomalies
* Investigate incidents

---

## **2.2 SLO-Focused Panels**

SRE dashboards prioritize panels that show:

* **User-visible performance** → latency, success rate
* **Error patterns** → 5xx spikes, anomalies
* **Service uptime** → availability indicators
* **Burn rate** (later)

This hands-on focuses on the first two.

---

# **3. Hands-On Task 1 — Build a Dashboard for Latency & Uptime**

## **Purpose:** Create a clear view of how the system is performing.

You will build **two essential panels**:

1. **Latency panel** (proxy metric using CPU + network if no custom app metrics exist)
2. **Uptime panel** (instance state + health)

---

## **Steps:**

1. Open **Navigation Menu (☰) → Observability & Management → Dashboards**.
2. Click **Create Dashboard**.
3. Enter:

   * **Name:** `<student-id>-sre-dashboard`
   * **Compartment:** your training compartment
4. Click **Create**.

You will now land in an empty dashboard.

---

## **A. Add Latency Panel (Proxy Metrics)**

Since the Class Enrollment App does not emit custom latency metrics by default, you will use **CPU + Network activity** as latency proxies.

### Steps:

1. Click **Add Widget → Metric Chart**.
2. In **Metric Namespace**, choose:

   * `oci_computeagent`
3. Under **Metric Name**, select:

   * `CpuUtilization`
4. Select your instance: `<student-id>-compute-training`.
5. Configure chart options:

   * **Statistic:** `P95` (or `Mean`) if available
   * **Interval:** `1 minute`
6. Title it:

   * **"Latency Proxy – CPU Utilization"**
7. Click **Create**.

Repeat to add a **NetworkBytesIn** or **NetworkBytesOut** panel.
These spikes often correlate with user actions.

---

## **B. Add Uptime Panel (Instance Health)**

1. Click **Add Widget → Metric Chart**.
2. Namespace:

   * `oci_computeagent`
3. Metric Name:

   * `CpuUtilization` or `DiskBytesRead`
4. Change **Chart Type** → `Status` if available.

This chart shows if the instance is reachable and healthy.

Alternative:

* Use a widget showing the instance **Lifecycle State** if available.

---

# **4. Hands-On Task 2 — Add Alarm Widgets**

## **Purpose:** Surface current alarms directly on the dashboard.

This helps real SREs quickly detect outages.

---

## **Steps:**

1. Click **Add Widget → Alarm**.
2. Choose your previously created CPU alarm:

   * `<student-id>-cpu-alarm`
3. Set display mode:

   * `Summary` or `Detailed`
4. Click **Add**.

Repeat if you create additional alarms (latency, uptime, etc.).

---

## **What You Should See on Your Dashboard:**

* **Latency proxy panel** (CPU charts)
* **Network activity panel**
* **Uptime panel** (instance health or status)
* **Alarm widget** showing OK/FIRING state

The dashboard now acts as a basic SRE observability console.

---

# **5. Summary of the Hands-On**

Today you built:

* A custom SRE dashboard
* Latency visualization using CPU and network as proxies
* Uptime and instance health visualization
* Alarm widgets for operational awareness

These are the foundations of an end-to-end observability system.

---

# **6. Solutions Key (Instructor Reference)**

Use this to verify student dashboards.

---

# **✔ Solution Key — Task 1: Latency & Uptime Dashboard**

### Expected Widgets:

1. **CPU Utilization (P95 or Mean)**
2. **NetworkBytesIn / NetworkBytesOut**
3. **Instance Health / Status Proxy Panel**

### Expected Dashboard Name:

```
<student-id>-sre-dashboard
```

### Why These Panels Are Correct:

* CPU spikes often indicate processing delays
* Network spikes correlate with traffic events
* Uptime panel shows instance availability

SRE dashboards must highlight **user-facing performance**, even if via proxy metrics.

---

# **✔ Solution Key — Task 2: Alarm Widgets**

### Expected Alarm Widget:

* `<student-id>-cpu-alarm`

### Expected State:

* **OK** (normal) OR
* **FIRING** (if CPU exceeded threshold)

### Why This Matters:

Alarms on dashboards give:

* Real-time visibility
* Quick triage paths
* Immediate understanding of system health

If students see real values updating, their dashboard is functioning correctly.

