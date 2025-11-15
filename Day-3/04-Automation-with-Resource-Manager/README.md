# Day 3 – Toil Reduction, Observability, and Automation

## Subtopic: Automation with Resource Manager

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Automation with Resource Manager

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

Automation is one of the most effective ways to eliminate toil. OCI **Resource Manager** is Oracle’s managed Terraform-based automation service used to provision, update, and tear down infrastructure in a consistent and repeatable manner.

Resource Manager provides:

* A managed Terraform execution environment
* State file storage without manual handling
* Drift detection
* Policy enforcement and change tracking
* Integration with IAM, OCI Logging, Monitoring, and Events

With Resource Manager, both IT engineers and developers can treat infrastructure as code (IaC), gaining reliability, repeatability, and reduced operational overhead.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Provision compute, networks, load balancers, storage using Terraform.
* Standardize environment creation across teams.
* Automate deployments for dev/test/prod.
* Reduce risk of configuration drift.

### Developers

* Spin up application environments consistently.
* Manage application-focused infrastructure like functions, API gateways.
* Submit infra changes through version control workflows.

### Unified View

```
Manual Operations → Terraform Templates → Resource Manager → Automated Infrastructure
```

---

# 3. Key Concepts

## 3.1 Infrastructure as Code (IaC)

Infrastructure is managed using text-based configuration files instead of manual clicks.

Benefits:

* Repeatability
* Version control
* Peer review and governance
* Reduced misconfiguration

---

## 3.2 Terraform Basics in Resource Manager

Resource Manager natively supports Terraform:

* Variables
* Providers
* Modules
* State management
* Plan & Apply lifecycle

---

## 3.3 Resource Manager Components

* **Stack** → A collection of Terraform configuration files
* **Jobs** → Plan, Apply, Destroy operations
* **State File** → Stored securely in OCI
* **Outputs** → Values generated after execution

---

# 4. Real-World Examples

### Example 1 — Provisioning Standardized Environments

Teams use the same Terraform template to create dev, test, and prod stacks.

### Example 2 — Eliminating Manual Networking Setup

VCN, subnets, route tables, security lists created automatically.

### Example 3 — Automated Deployment for Application Teams

Developers use Resource Manager to deploy application VMs, OKE clusters, or serverless components.

---

# 5. Case Study

### Scenario: Manual Provisioning Causing Toil

An engineering team manually provisions:

* VCN
* Compute Instances
* Load balancers
* IAM policies

### Problems

* Inconsistent environments
* Slow provisioning times
* Frequent human errors

### Solution

* Terraform templates created
* Resource Manager stacks deployed
* All environments standardized

### Result

* Deployment time reduced from hours to minutes
* Human errors eliminated
* Toil dropped significantly

---

# 6. Hands-On Exercise (Summary Only)

A separate hands-on lab will follow. It will include:

* Creating a Terraform template
* Uploading it to Resource Manager
* Running Plan and Apply jobs
* Reviewing outputs
* Destroying the stack when complete

---

# 7. Architecture / Workflow Diagrams

### Diagram 1 — Resource Manager Lifecycle

```
Terraform Code → Stack → Plan Job → Apply Job → Infrastructure
```

### Diagram 2 — IaC Workflow

```
Git Repo → Resource Manager Stack → Job Execution → OCI Resources
```

### Diagram 3 — Example Deployment

```
Stack
 ├── VCN Module
 ├── Compute Module
 ├── LB Module
 └── IAM Module
```

---

# 8. Best Practices

* Store Terraform templates in version control.
* Use modules for reusable patterns.
* Apply tagging standards.
* Use variables for environment-specific values.
* Review Plan outputs carefully before Apply.

---

# 9. Common Mistakes

* Hardcoding values in templates.
* Ignoring drift detection warnings.
* Running Apply without reviewing the Plan.
* Mixing manual and automated provisioning.

---

# 10. Checklist

* Understand stack structure.
* Know how to upload Terraform configuration.
* Know how to run Plan and Apply jobs.
* Understand drift detection and its impact.
* Know how to manage outputs.

---

# 11. Additional Notes

* This subtopic prepares you for the Day 3 Subtopic 4 Hands-On lab.
* Terraform with Resource Manager becomes essential for Day 5’s capstone project.
