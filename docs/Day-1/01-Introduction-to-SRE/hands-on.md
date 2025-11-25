
## Hands-on Lab

## 1. Objective of This Hands-On Session

By the end of this exercise, learners should be able to:

* Navigate the OCI Console confidently
* Locate and understand the purpose of **Compute** (where workloads run)
* Locate and understand the purpose of **Monitoring** (where system health is observed)
* Build a foundation for later SRE activities such as incident debugging, metric analysis, and SLO validation

This exercise is intentionally simple. It ensures everyone—regardless of background—starts with the same understanding of the cloud environment.


## 2. Accessing the OCI Console

### Purpose: Reach the main cloud dashboard where all resources are managed.

### Steps:

1. Open your browser.
2. Go to **[https://cloud.oracle.com](https://cloud.oracle.com)**.
3. Sign in using your OCI account.

### Why it matters:

Every operational task begins here—provisioning compute, viewing logs, checking metrics, responding to incidents. This is the control room for the cloud.

### What you should see:

A homepage showing recent resources, tenancy details, and the left-side navigation menu.


## 3. Navigating to the Compute Service

### Purpose: Understand where virtual machines (instances) are created and managed.

### Steps:

1. Open the **Navigation Menu (☰)**.
2. Go to **Compute**.
3. Click **Instances**.

### Why it matters:

In SRE work, Compute is often the first stop:

* debugging application failures
* checking VM health
* verifying instance state
* viewing logs and resource usage

Whether you run an application, a script, or an automation tool—Compute is the base layer.

### What you should see:

A list of VM instances (or an empty list). From here you can:

* create new VMs
* start/stop instances
* open instance details

This page becomes important later during monitoring and incident simulations.


## 4. Navigating to the Monitoring Service

### Purpose: Learn where to view system health indicators such as CPU, memory, latency, and custom metrics.

### Steps:

1. Open the **Navigation Menu (☰)**.
2. Scroll to **Observability & Management**.
3. Click **Monitoring**.
4. Select **Metric Explorer**.

### Why it matters for SRE:

Monitoring is one of the pillars of Site Reliability Engineering. You will use it to:

* verify whether a service is healthy
* observe trends leading to an incident
* evaluate SLOs and understand error budgets
* confirm if capacity is sufficient

SREs rely more on metrics and dashboards than on logs or consoles during active incidents.

### What you should see:

A clean interface showing metrics grouped by resource type. You will later use this to:

* plot CPU and memory usage for VMs
* analyze spikes or declines in performance
* view multi-dimensional time-series data


## 5. Key Takeaways for Learners

* **Compute = where things run.** This is the execution environment.
* **Monitoring = how we observe system health.** This is your early‑warning system.
* These two services form the base of nearly every SRE investigation.
* You do not need to configure anything today—only understand location and purpose.

This foundational knowledge ensures everyone is ready for deeper SRE concepts such as incident response, alerting, dashboards, and reliability analysis.


## 6. Quick Reference (Keep Handy)

### Compute Location:

☰ → **Compute** → **Instances**

### Monitoring Location:

☰ → **Observability & Management** → **Monitoring** → **Metric Explorer**


