# Day 1 – SRE Fundamentals and OCI Foundations

## Subtopic: OCI Core Architecture

---

## 1. Concept Overview

OCI (Oracle Cloud Infrastructure) core architecture provides the foundational building blocks required to deploy reliable, secure, and scalable applications. For IT engineers and developers, understanding OCI’s architectural components is essential for designing applications that meet SRE-driven reliability targets such as availability, latency, and resilience.

OCI’s design principles include:

* **High isolation** through compartments and VCNs
* **Predictable performance** via bare-metal and virtual compute
* **Network-level flexibility** similar to on-prem data centres
* **Integrated observability** through metrics, logs, and traces

This subtopic focuses on the most important architectural elements relevant for SRE.

---

## 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Helps design network layouts, routing, and security configurations.
* Supports creating reliable deployment targets (subnets, gateways, load balancers).
* Enables capacity planning using compute shapes, block volumes, and autoscaling.

### Developers

* Understand how application behaviour interacts with OCI components.
* Know where latency originates (LB → VM → DB → external calls).
* Learn how logs, metrics, traces flow through OCI.

### Unified View

```
Application Code → Runs on Compute → Connected via VCN → Observed via Logging/Monitoring
```

---

## 3. Key Principles

### Principle 1: Compartmentalisation

OCI uses compartments to isolate resources for permissions, billing, and governance.

### Principle 2: Software-Defined Networking

VCNs offer complete control of routing, subnets, gateways, and firewall rules.

### Principle 3: Compute Architecture

Multiple compute options allow predictable performance:

* VM Standard Shapes
* Flexible VM Shapes
* Bare Metal Instances
* Autoscaling Instance Pools

### Principle 4: High-Availability Services

Load balancers, subnets, fault domains, and AD/FD placement ensure reliability.

### Principle 5: Integrated Observability

Logs + metrics + alarms allow SRE to detect degradation early.

---

## 4. Real-World Examples

### Example 1 — Latency Caused by Cross-AD Traffic

Developer hosts app in AD1, database in AD3. Cross-AD call increases latency.
SRE redesigns architecture using AD-local deployments.

### Example 2 — OCI Load Balancer Backend Failures

Backend VMs placed in same FD cause outages during host maintenance.
SRE enforces placement across FDs.

### Example 3 — Routing Misconfiguration

IT engineer creates private subnet but forgets NAT gateway.
Outbound API calls fail.
SRE identifies routing issue using VCN flow logs.

---

## 5. Case Study

### Scenario: Application Outage Due to Missing HA Configuration

```
Users → LB → App VM (Single AD) → Database
```

### Problem

* Compute instance placed in a single Availability Domain.
* AD-level maintenance caused full downtime.
* No instance pool or failover.

### Investigation

* SRE reviews fault domain/AD placement.
* Monitoring shows zero healthy hosts.
* Logs show no inbound connections.

### Remediation

* Deploy instance pool across multiple ADs.
* Add autoscaling to handle traffic spikes.
* Apply health checks and alarms.

### Result

* Single failure no longer causes outage.

---

## 6. Architecture / Workflow Diagrams

### Diagram 1 — OCI Core Components

```
                   +-----------------------+
                   |      Compartment      |
                   +-----------+-----------+
                               |
                               v
                 +---------------------------+
                 |        VCN (CIDR)         |
                 +-----------+---------------+
                             |
      +----------------------+----------------------+
      |                                             |
      v                                             v
+-------------+                              +--------------+
| Public Subnet|                              | Private Subnet|
+------+-------+                              +------+--------+
       |                                               |
       v                                               v
[Load Balancer]                                [Application VMs]
       |                                               |
       +-----------------------+-----------------------+
                               |
                               v
                        [Autonomous DB]
```

### Diagram 2 — High Availability Placement

```
+------------------------+
|  Availability Domain 1 |
|   +----------------+   |
|   | Fault Domain A |   |
|   +----------------+   |
+------------------------+

+------------------------+
|  Availability Domain 2 |
|   +----------------+   |
|   | Fault Domain B |   |
|   +----------------+   |
+------------------------+
```

### Diagram 3 — Observability Flow

```
Compute → Metrics → Monitoring
Compute → Logs → Logging
Load Balancer → Health Checks → Monitoring
Database → Metrics → Monitoring
```

---

## 7. Best Practices

* Always deploy across multiple ADs/Fault Domains.
* Use private subnets for application tier.
* Use appropriate gateways (IGW/NAT/Service Gateway).
* Enable VCN flow logs for network diagnostics.
* Ensure Cloud Agent is enabled for full metrics.
* Use instance pools instead of standalone VMs.

---

## 8. Common Mistakes

* Placing all compute resources in a single AD.
* Missing NAT gateway in private subnet.
* Not enabling health checks for LB backends.
* Using incorrectly sized compute shapes.

---

## 9. Additional Notes

* OCI’s architecture offers deeper control compared to many clouds.
* SRE depends heavily on these core compo
