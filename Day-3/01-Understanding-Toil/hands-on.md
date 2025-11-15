# Day 3 – Toil Reduction, Observability, and Automation

## Hands-On Lab: Understanding and Identifying Toil

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Hands-On for Understanding Toil

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab guides participants through the process of:

* Identifying toil within an OCI environment,
* Classifying tasks into SRE work categories,
* Evaluating toil impact and frequency,
* Prioritizing automation opportunities.

This practical exercise strengthens your ability to separate high-value engineering work from repetitive operational work.

---

# 2. Objectives

* Examine operational tasks commonly performed by IT engineers and developers.
* Identify tasks that meet the definition of toil.
* Categorize tasks as Toil, Engineering Work, or Planned Work.
* Rank tasks based on frequency and operational impact.
* Prepare a structured output that forms a backlog for automation.

---

# 3. Prerequisites

### OCI Requirements

* At least one active OCI environment containing:

  * Compute instances
  * Load balancer (optional)
  * Logging and Monitoring enabled

### Knowledge Requirements

* Understanding of toil definition (from Subtopic 1).
* Familiarity with day-to-day operational workflows.

---

# 4. Architecture / Diagram

```
Operational Tasks → Classification → Prioritization → Automation Backlog
```

---

# 5. Step-by-Step Procedure

## Step 1: Collect Operational Tasks

Create an explicit list of operational tasks performed in your environment.
Include tasks such as:

* Restarting instances
* Reviewing logs for errors
* Scaling compute shapes manually
* Applying OS patches
* Managing block volume space
* Responding to repetitive alerts
* Creating new users or updating IAM policies

Document all tasks without filtering.

---

## Step 2: Classify Each Task

Use the following classification framework:

### **1. Toil** (repetitive, manual, automatable, adds no lasting value)

Examples:

* Manual log scanning
* Manual instance restarts
* Manual scaling

### **2. Engineering Work** (creates long-term value)

Examples:

* Writing an autoscaling script
* Designing VCN architecture

### **3. Planned Work** (routine but valuable)

Examples:

* Quarterly security review
* Capacity planning exercise

Create a table similar to:

```
+----------------------------+----------------------+----------------------+
| Task                       | Category             | Notes                |
+----------------------------+----------------------+----------------------+
| Restart instance daily     | Toil                 | Occurs daily         |
| Design autoscaling policy  | Engineering Work     | One-time effort      |
| IAM quarterly review       | Planned Work         | Adds compliance value|
+----------------------------+----------------------+----------------------+
```

---

## Step 3: Validate Toil Characteristics

For each task marked as **Toil**, confirm that it meets all SRE-defined attributes:

* **Manual** → Requires human interaction
* **Repetitive** → Occurs frequently
* **Scales with load** → Grows as system grows
* **Automatable** → Can be scripted or automated
* **No lasting value** → System state unchanged post-task

Only tasks meeting *all* criteria qualify as toil.

---

## Step 4: Rank Toil Tasks by Priority

Use the following parameters:

* **Frequency** (daily, weekly, monthly)
* **Impact** (low, medium, high)
* **Effort to Automate** (low, medium, high)

Ranking formula (simple version):

```
Priority = Frequency + Impact – Effort to Automate
```

Create a ranking table:

```
+--------------------------+----------+----------+---------------------+-----------+
| Task                     | Frequency| Impact   | Effort to Automate | Priority  |
+--------------------------+----------+----------+---------------------+-----------+
| Manual log reviews       | High     | Medium   | Low                 | High      |
| Manual instance restart  | Medium   | High     | Medium              | Medium    |
+--------------------------+----------+----------+---------------------+-----------+
```

---

## Step 5: Identify Automation Opportunities

For each high-priority toil task, identify possible automation paths:

### Example Automations

* **Manual log review →** Logging queries + Alerts
* **Manual restarts →** Load balancer health check + Instance pool
* **Manual scaling →** Autoscaling policy
* **Disk monitoring →** Alarm + Block Volume Autogrow Script

Document automation approach for each task.

---

## Step 6: Prepare the Toil Reduction Backlog

Create a structured backlog:

```
+------------------------+---------------------+------------------------------+
| Toil Task              | Automation Method   | Next Steps                   |
+------------------------+---------------------+------------------------------+
| Manual log review      | Logging queries     | Implement structured queries |
|                        | & alarm rules       | Create 5xx alert             |
+------------------------+---------------------+------------------------------+
```

This backlog will be used in Day 5 for automation planning.

---

# 6. Expected Output / Verification

Participants should end with:

* A complete inventory of operational tasks.
* A categorized task list.
* A validated list of toil tasks.
* A prioritized list for automation.
* A documented backlog.

Verification checklist:

```
[ ] All operational tasks identified
[ ] Categories assigned correctly
[ ] Toil validated using SRE criteria
[ ] Tasks prioritized based on impact/frequency
[ ] Automation backlog created
```

---

# 7. Troubleshooting Guidelines

**Unclear task categorization:**

* Ask: "Does this add long-term value?"
* If no → likely toil.

**Too many tasks marked as toil:**

* Re-check criteria; not all repetitive tasks are toil.

**Difficulty assigning impact:**

* Look at historical incidents or workload patterns.

**Multiple stakeholders performing same toil:**

* Combine inputs and re-rank.

---

# 8. Best Practices Learned

* Always maintain a running list of toil.
* Attack high-frequency toil first.
* Prioritize automations that provide the largest reliability gain.
* Revisit your toil backlog monthly.
* Focus on measurable outcomes after automation.

---

# 9. Additional Notes

* This lab forms a foundation for Day 3 Subtopic 4 (Automation with Resource Manager).
* Toil reduction is an ongoing SRE and engineering responsibility.
