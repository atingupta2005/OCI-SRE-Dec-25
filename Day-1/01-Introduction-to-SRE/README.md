# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: Introduction to SRE

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → Introduction to SRE

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

Site Reliability Engineering (SRE) is an engineering discipline focused on ensuring that systems run reliably, predictably, and at scale. It brings together principles from software engineering and infrastructure operations to remove uncertainty from production environments.

For IT engineers and developers, SRE can be summarized as:

* A way to engineer system reliability, rather than "manage" it.
* A structured approach to measure, improve, and automate system behaviour.
* A discipline that ensures the code you write or deploy behaves correctly under real workloads.
* A method to understand how applications behave under stress, failure, and unpredictable user patterns.

SRE is not a support function. It is an engineering role focused on system design, measurement, automation, and operational excellence.

### Conceptual Representation

```
Software Engineering + Systems Engineering + Operations Automation
                           |
                           v
                   Site Reliability Engineering
```

---

# 2. How This Applies to IT Engineers and Developers

### For IT Engineers

* SRE provides structured tools and practices to reduce repetitive operational tasks.
* It clarifies how availability, latency, monitoring, and scaling should be engineered.
* Helps shift from:

  * Manual deployments → Automated CI/CD
  * Reactive troubleshooting → Proactive observability
  * Ad-hoc scripts → Standardised automation
  * Ticket-driven work → Measurable engineering improvements

### For Developers

* SRE helps developers understand how their code behaves in real-world conditions.
* Ensures that the application is:

  * Observable
  * Measurable
  * Fault-tolerant
  * Scalable
* Helps answer:

  * What happens to my API when concurrency increases?
  * What happens when a downstream dependency slows?
  * What metrics prove that my feature is working correctly?

### Developer ↔ IT Engineer ↔ SRE Relationship

```
Developer: Build the feature  
IT Engineer: Deploy and support the environment  
SRE: Ensure the entire system meets reliability targets
```

---

# 3. Key Principles

### Reliability Must Be Measured

SRE defines reliability through SLIs (metrics) and SLOs (targets), removing subjectivity.

### Automate Repetitive Work

Manual operations increase error risk; automation ensures consistency.

### Systems Must Be Observable

Logs, metrics, and traces allow engineers to understand behaviour, troubleshoot, and improve systems.

```
Application
  | \
  |  \
 Logs Metrics Traces
  |    |       |
  v    v       v
 Observability Platform --> SRE Action
```

### Design for Failure

Systems should continue functioning even when components degrade.

### Controlled Change Management

SRE ensures safe rollouts using strategies such as canary deployments and feature flags.

### Blameless Learning Culture

Learning from incidents without individual blame.

---

# 4. Real-World Examples

### Example 1 — API Latency Spikes

A new feature increases API execution time.

* Developers see a need to optimise code.
* SRE sees a P99 latency breach impacting user experience.

SRE Actions:

* Track latency SLIs.
* Visualise P95/P99 spikes.
* Work with developers to optimise slow paths.

### Example 2 — OCI Compute Instance Degradation

An OCI VM slows down and becomes temporarily unresponsive.

* IT engineer restarts the instance.
* Issue reappears.

SRE Actions:

* Review CPU, memory, disk, network metrics.
* Identify memory leak due to app behaviour.
* Implement monitoring and alerts.

### Example 3 — Deployment-Induced Downtime

Deployment causes configuration errors.

SRE Improvements:

* Introduce canary deployment.
* Add config validation in CI.
* Enforce health checks.
* Track deployment-related failures.

### Example 4 — OCI Load Balancer Backend Issues

* Two backend servers under heavy load.
* Developers focus on logs; IT checks system metrics.

SRE Solution:

* Add LB health checks.
* Enable autoscaling.
* Configure latency/error SLIs.
* Build backend health dashboards.

---

# 5. Case Study: Holiday Traffic Failure

### Architecture

```
Users
  |
  v
[OCI Load Balancer]
  |
  +---> [VM1 - Application]
  |
  +---> [VM2 - Application]
          |
          v
     [Database]
```

### What Happened

* Heavy traffic led to CPU overload.
* VM became unhealthy; LB still routed traffic.
* Logs lacked correlation IDs.
* Troubleshooting was slow.

### IT Engineer Perspective

* Restarted the VM.

### Developer Perspective

* Suspected slow SQL queries.

### SRE Perspective

* Reliability degradation.
* Missing alarms and visibility.
* Need better health checks and autoscaling.

### SRE Improvements

* Added latency, availability and error SLIs.
* Enabled autoscaling.
* Corrected LB health checks.
* Added trace IDs.
* Built saturation dashboards.

### Result

System scaled automatically during subsequent spikes without downtime.

---

# 6. Hands-On Exercise

### Objective

Understand how OCI surfaces reliability signals.

### Step 1 — Compute Metrics

* Explore CPU, memory, disk I/O, network throughput.

### Step 2 — Monitoring Metrics

* Check compute agent and LB metrics.

### Step 3 — Logging

* Inspect application, system and VCN flow logs.

### Step 4 — Network Flow

* Analyse VCN, subnets, security lists and routing.

### Expected Outcomes

* Ability to interpret reliability signals.
* Understand how failures map to metrics/logs.

### Troubleshooting

* Missing metrics: instance agent issue.
* Missing logs: IAM or configuration.
* Slow VM: app memory leak or saturation.

---

# 7. Architecture / Workflow Diagrams

### SRE Workflow

```
User Request
    |
    v
[Application]
    |
    +----------+
    |          |
 Logs       Metrics
    |          |
    v          v
[OCI Logging] [OCI Monitoring]
        \     /
         v   v
    Observability Layer
         |
         v
    SLO Evaluation
         |
         v
    Alerts + Dashboards
         |
         v
    SRE Action
```

### Failure Path

```
Slow Database Query
         |
         v
Application Latency
         |
         v
Increased LB Response Time
         |
         v
User Timeout
```

---

# 8. Best Practices

* Treat reliability as a key requirement.
* Implement observability early.
* Automate operational tasks.
* Use SLIs that represent user experience.
* Apply safe rollout mechanisms.
* Maintain updated architecture records.

---

# 9. Common Mistakes

* Ignoring metrics and relying only on logs.
* Missing LB health checks.
* Manual scaling.
* Poor logging patterns.
* Lack of dependency documentation.

---

# 10. Checklist

* Can explain SRE role for IT/Dev teams.
* Can read OCI monitoring metrics.
* Understand impact of code on reliability.
* Knows how LB, VMs and logs relate to SRE.

---

# 11. Additional Notes

* SRE becomes most effective when integrated early in design and development cycles.
* IT engineers and developers benefit significantly from adopting SRE thinking.
