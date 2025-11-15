# Day 2 – Measuring Reliability and Monitoring on OCI

## Hands-On Lab: Creating Alarms and Notifications

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → Hands-on for Alarms and Notifications

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab focuses on setting up **OCI Alarms** and configuring **OCI Notifications** to ensure reliability issues are detected and communicated in real time.
Participants will:

* Create a Notifications Topic.
* Add an email subscription.
* Configure a CPU-based alarm.
* Validate alarm states and trigger behavior.

This aligns directly with SRE practices, where actionable alerts must be tied to real user-impacting signals.

---

# 2. Objectives

* Create a Notifications Topic.
* Subscribe an email address for alert delivery.
* Create a threshold alarm for CPU usage.
* Understand alarm states and evaluation periods.
* Validate alarm triggering.

---

# 3. Prerequisites

### OCI Requirements

* Compute instance (VM or Bare Metal) in RUNNING state.
* Monitoring and Notifications permissions:

  * `monitoring.*`
  * `ons.*`
  * `instance-family.read`

### Knowledge Requirements

* Understanding of metrics from Subtopic 2.

---

# 4. Architecture / Diagram

```
Metric (CPUUtilization)
       |
       v
 OCI Alarm Rule → Notification Topic → Email Subscriber
```

---

# 5. Step-by-Step Procedure

## Step 1: Create a Notifications Topic

1. Open OCI Console.
2. Navigate to:
   **Observability & Management → Notifications → Topics**.
3. Click **Create Topic**.
4. Provide:

   * Name: `cpu-alerts-topic`
   * Description: `Topic for CPU threshold alarms`
5. Click **Create**.

### Verify

Topic appears in the topics list.

---

## Step 2: Create an Email Subscription

1. Open the newly created topic.
2. Click **Create Subscription**.
3. Choose Protocol: **Email**.
4. Enter your email address.
5. Click **Create**.
6. Check your inbox for a confirmation email.
7. Click **Confirm Subscription**.

### Verify

Subscription shows status **CONFIRMED**.

---

## Step 3: Open Monitoring → Alarms

1. Navigate to:
   **Observability & Management → Monitoring → Alarms**.
2. Click **Create Alarm**.

---

## Step 4: Define Alarm Details

1. Name: `high-cpu-alarm`
2. Severity: **Critical** or **Warning** (choose based on environment)
3. Metric Namespace: `oci_computeagent`
4. Metric Name: `CpuUtilization`
5. Dimensions:

   * resourceId → Select your instance OCID

---

## Step 5: Configure Alarm Trigger Rule

1. Choose **Threshold** type.
2. Set Condition:

   * **CpuUtilization > 80%**
3. Trigger Delay:

   * **5 minutes** (avoids noise)
4. Evaluation Window:

   * 5 minutes or 1 minute depending on sensitivity.

Example Query (auto-generated):

```
CpuUtilization[5m].mean() > 80
```

---

## Step 6: Set the Notification Channel

1. Under **Notifications**, choose the topic created earlier:

   * `cpu-alerts-topic`
2. Leave default repeat notifications.
3. Click **Create Alarm**.

### Verify

Alarm appears in the alarms list.

---

## Step 7: Test Alarm Firing (Optional)

To simulate high CPU:

1. SSH into your compute instance.
2. Run:

```
sudo dnf install -y stress-ng
sudo stress-ng --cpu 4 --timeout 300
```

3. Monitor alarm state in console:

   * Navigate to Monitoring → Alarms
   * Watch **state = FIRING** after threshold breach.

### Notes

Alarms evaluate based on **evaluation intervals**, so firing may take a few minutes.

---

# 6. Expected Output / Verification

You should be able to validate:

* Notifications topic created.
* Email subscription confirmed.
* Alarm created successfully.
* Alarm tied to correct instance & metric.
* Ability to observe alarm firing when CPU threshold is exceeded.

Verification Checklist:

```
[ ] Topic created
[ ] Email subscription confirmed
[ ] Alarm visible in list
[ ] Alarm bound to CpuUtilization metric
[ ] Alarm triggers in test scenario
```

---

# 7. Troubleshooting Guidelines

**Subscription not receiving emails:**

* Check spam folder.
* Confirm subscription manually.
* Re-add subscription.

**Alarm not firing:**

* Lower threshold temporarily.
* Increase CPU load.
* Verify correct metric namespace.
* Confirm evaluation interval.

**Metric missing:**

* Ensure Cloud Agent plugins are enabled.
* Refresh Metric Explorer to validate.

---

# 8. Best Practices Learned

* Always test alarms after creation.
* Use appropriate severity levels.
* Avoid short evaluation periods to reduce noise.
* Integrate email with on-call rotation.
* Tie alarms to SLI-based thresholds for meaningful alerts.

---

# 9. Additional Notes

* Alarms can also push to HTTPS endpoints for Slack or PagerDuty.
* Composite alarms help reduce false positives.
