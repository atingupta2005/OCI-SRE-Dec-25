# Day 1 – SRE Fundamentals and OCI Foundations

## Hands-On Lab: SRE vs DevOps vs Platform Engineering

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → Hands-On for SRE vs DevOps vs Platform Engineering

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab allows IT engineers and developers to understand **how SRE, DevOps, and Platform Engineering interact with OCI services**. The goal is to help participants:

* Identify which OCI components are typically used by each discipline.
* Observe how deployments, platform tooling, and reliability signals intersect.
* Understand practical ownership boundaries using real OCI resources.

This lab is not about building new components; it is about **studying and analysing existing OCI infrastructure and pipelines** through the lens of each discipline.

---

# 2. Objectives

* Identify OCI resources used by SRE, DevOps, and Platform Engineering.
* Understand how deployments move through OCI pipelines.
* Review how reliability signals (health checks, metrics, logs) relate to SRE responsibilities.
* Understand how Platform Engineering ensures consistency via reusable modules.
* Map resource interactions to engineering responsibilities.

---

# 3. Prerequisites

### OCI Requirements

* Access to an OCI tenancy.
* View-level permissions for:

  * Compute
  * Instance Pools
  * Load Balancers
  * Logging
  * Monitoring
  * Resource Manager (for IaC modules)
  * DevOps (if pipelines exist)

### Environment Requirements

* At least one deployed application environment or sample application.
* Access to **Load Balancer**, **Instance Pool**, or **Deployment Pipeline** resources.

---

# 4. Architecture / Diagram

The lab uses an architecture where deployments, platform tooling, and reliability signals converge:

```
                     +------------------------------+
                     |          Developers           |
                     +------------------------------+
                                   |
                                   v
                        +---------------------+
                        |    DevOps Pipeline  |
                        +----------+----------+
                                   |
                                   v
                        +---------------------+
                        | Platform Modules    |
                        | (Terraform / RM)    |
                        +----------+----------+
                                   |
                                   v
                      +----------------------------+
                      |  Application Infrastructure |
                      +------+------------+---------+
                             |            |
                             v            v
                    [Instance Pool]   [Load Balancer]
                             |            |
                             +------------+
                                          |
                                          v
                               [OCI Monitoring]
                               [OCI Logging]
                                          |
                                          v
                                        [SRE]
```

---

# 5. Step-by-Step Procedure

## Step 1: Inspect DevOps Pipeline (If Available)

1. Open the navigation menu.
2. Navigate to:
   **Developer Services → DevOps → Projects**.
3. Select a project.
4. Open **Build Pipelines** or **Deployment Pipelines**.
5. Review stages such as:

   * Build
   * Test
   * Artifact Delivery
   * Deployment

### Observations

* This is where DevOps focuses its efforts: build, test, deploy automation.
* SRE's interaction begins when deployment moves to production and reliability becomes a concern.

---

## Step 2: Review Platform Engineering Components via Resource Manager

1. Open the navigation menu.
2. Navigate to:
   **Developer Services → Resource Manager → Stacks**.
3. Select a stack.
4. Inspect:

   * Terraform template variables
   * Modules used (VPC, compute, LB, instance pool)
   * Configuration parameters

### Observations

* Platform Engineering provides these reusable modules.
* Developers and IT engineers consume them rather than building infra manually.

---

## Step 3: Examine Application Infrastructure

1. Open the navigation menu.

2. Navigate to:
   **Compute → Instance Pools**.

3. Select an instance pool.

4. Inspect:

   * Scaling configuration
   * Instance configuration
   * Template image

5. Navigate to:
   **Networking → Load Balancers**.

6. Select the load balancer.

7. Review:

   * Backend sets
   * Health checks
   * Listener configuration

### Observations

* Instance pools and LBs are where reliability standards are enforced.
* Health checks are critical SRE indicators.

---

## Step 4: Observe Logging and Monitoring Signals

1. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.

2. Query metrics for:

   * Instance pool
   * Load balancer
   * Compute instances

3. Navigate to:
   **Observability & Management → Logging → Log Explorer**.

4. Filter logs for:

   * Application logs
   * System logs
   * Load balancer access logs (if enabled)

### Observations

* These signals help SRE detect reliability degradation.
* Developers use logs to examine application behaviour.
* IT engineers use metrics and logs to solve infrastructure issues.

---

## Step 5: Map Roles to Observed Components

Using the information gathered:

### Identify which parts belong to:

* **SRE:**

  * Monitoring
  * Logging
  * Health checks
  * Incident detection

* **DevOps:**

  * CI/CD pipeline
  * Deployment automation

* **Platform Engineering:**

  * Terraform modules in Resource Manager
  * Standardized instance pool templates
  * Networking baseline (VCN modules)

* **Developers:**

  * Application logs
  * Code deployments
  * Performance-impacting changes

---

# 6. Expected Output / Verification

By completing this lab, you should be able to:

* Identify how deployments are automated via DevOps pipelines.
* Trace how Platform Engineering provides reusable infrastructure.
* Observe how SRE consumes logs and metrics for reliability.
* Identify load balancer health checks and their importance.
* Understand where developers influence reliability.

Verification checks:

* Able to open and navigate pipeline stages.
* Able to inspect Resource Manager stack variables.
* Able to view instance pool and LB configurations.
* Able to query required metrics in Metric Explorer.
* Able to view logs in Log Explorer.

---

# 7. Troubleshooting Guidelines

**No pipelines found:**

* Your compartment may not contain DevOps pipelines.
* Ask for access or use sample pipelines if available.

**Cannot view Resource Manager stacks:**

* Ensure you have access to the correct compartment.

**Instance pool metrics not loading:**

* Metric Explorer may need specific filters.
* Instance pool may need activity to generate metrics.

**No logs available:**

* Logging may not be enabled for the selected resource.

---

# 8. Best Practices Learned

* Align deployment processes with reliability goals defined by SRE.
* Use platform-provided modules to ensure consistency.
* Treat load balancer health checks as a critical reliability signal.
* Use monitoring dashboards to observe the impact of deployments.
* Maintain clear separation of responsibilities while enabling collaboration.

---

# 9. Additional Notes

* This lab establishes the practical foundations for understanding ownership boundaries.
* Future labs will explore SLO-based release gates, autoscaling design, and end-to-end observability.
