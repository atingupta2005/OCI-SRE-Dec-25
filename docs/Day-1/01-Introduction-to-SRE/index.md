# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: Introduction to SRE

---

## 1. Concept Overview

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

## 2. How This Applies to IT Engineers and Developers

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

## 3. Key Principles

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

## 4. Real-World Examples

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


## 4. Additional Notes

* SRE becomes most effective when integrated early in design and development cycles.
* IT engineers and developers benefit significantly from adopting SRE thinking.
