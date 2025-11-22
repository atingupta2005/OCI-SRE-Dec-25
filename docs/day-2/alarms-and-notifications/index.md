# Day 2 – Measuring Reliability and Monitoring on OCI

## Subtopic: Alarms and Notifications

### TOC Reference: Day 2 → Measuring Reliability and Monitoring on OCI → Alarms and Notifications

### Audience Context: IT Engineers and Developers

---

# 1. Concept Overview

OCI Alarms and Notifications form the operational backbone for detecting and communicating reliability issues in real time. Once SLIs and SLOs are defined, alarms turn SLO breaches or system anomalies into actionable alerts.

Alarms evaluate metrics at regular intervals and send notifications only when thresholds or conditions are met. Notifications service delivers these alerts to channels such as email, Slack (via HTTPS endpoint), PagerDuty, or custom HTTPS webhooks.

Key capabilities:

* Trigger on metric thresholds (e.g., CPU > 80%).
* Trigger on missing metric data.
* Support for composite alarm rules.
* Integration with OCI Events and external systems.

---

# 2. How This Applies to IT Engineers and Developers

### IT Engineers

* Configure resource-based alarms (compute, load balancer, VCN).
* Receive alerts for high CPU, memory saturation, or unhealthy backends.
* Use notifications to coordinate incident response.

### Developers

* Create application-level alarms (custom metrics).
* Receive early signals for application errors, latency increases, or external API failures.

### Unified View

```
Metrics → Alarm Rule → Notification → Human / Automation
```

---

# 3. Key Concepts

## 3.1 Alarm Types

1. **Threshold Alarms** – Trigger when metric crosses a threshold.
2. **Absence Alarms** – Trigger when metrics stop being emitted.
3. **Composite Alarms** – Combine multiple alarm conditions.

---

## 3.2 Alarm States

* **OK** – Metric within expected range.
* **FIRING** – Threshold breached.
* **INSUFFICIENT DATA** – Monitoring cannot evaluate the rule.

---

## 3.3 Notification Topics and Subscriptions

To receive alerts, alarms publish to a **Notifications Topic**.

A topic may have multiple subscriptions:

* Email
* HTTPS webhook
* Slack integration
* PagerDuty
* Custom on-call system

---

# 4. Real-World Examples

### Example 1 — CPU Spike on Production VM

* Alarm triggers at CPU > 85% for 5 minutes.
* Email notification sent to on-call engineer.
* Engineer identifies runaway process.

### Example 2 — Load Balancer Unhealthy Backends

* Alarm fires when `BackendHealthyHostCount < 1`.
* Indicates outage or resource exhaustion.

### Example 3 — Application Error Rate Increase (Custom Metric)

* Developers emit `custom.myapp.errors`.
* Alarm triggers when error rate exceeds SLO.

---

# 5. Case Study

### Scenario: Checkout API experiencing intermittent failures

```
User → LB → Checkout API → Database
```

### Problem

* Error budget burn detected from SLO dashboard.
* No early alarm triggered.

### Investigation

* No alarm existed for **5xx response rate**.

### Resolution

* SRE creates threshold alarm for `HttpResponseCounts[5xx]`.
* Developers add custom error metric for application-level failures.
* Notifications configured for on-call rotation.

### Result

* Early detection in future incidents.

---

# 6. Hands-On Exercise (Summary Only)

A detailed hands-on lab will be created separately.
It will include:

* Creating a Notifications topic.
* Adding email subscription.
* Creating an alarm for CPU usage.
* Triggering alarm conditions for testing.

---

# 7. Architecture / Workflow Diagrams

### Diagram 1 — Alarm Flow

```
Metric → Alarm Condition Evaluator → Alarm State → Notification Topic → Subscriber
```

### Diagram 2 — Notification Architecture

```
+---------------------+
|   Alarm Rule        |
+----------+----------+
           |
           v
+---------------------+
| Notification Topic  |
+----------+----------+
           |
   +-------+--------+
   |                |
   v                v
Email          HTTPS/Webhook
```

### Diagram 3 — Example Threshold Alarm

```
IF CpuUtilization > 85%
FOR 5 minutes
THEN trigger alarm
```

---

# 8. Best Practices

* Configure alarms for symptoms, not infrastructure only.
* Avoid overly sensitive thresholds causing alert fatigue.
* Use SLOs to determine correct alarm thresholds.
* Always configure a notification channel before activating alarms.
* Use composite alarms for correlated failures.

---

# 9. Common Mistakes

* Relying only on CPU alarms without application-level alarms.
* Not testing alarms after creation.
* Using too short intervals → noisy alerts.
* Missing notification subscriptions.

---

# 10. Checklist

* Understand alarm types and states.
* Know how to configure notification topics.
* Able to select correct metrics and namespaces.
* Familiar with composite alarm concepts.

---

# 11. Additional Notes

* The upcoming hands-on lab will focus on creating alarms and email notifications using OCI Monitoring and Notifications.
