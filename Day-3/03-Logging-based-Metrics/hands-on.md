# Day 3 – Toil Reduction, Observability, and Automation

## Hands-On Lab: Creating Logging-Based Metrics

### TOC Reference: Day 3 → Toil Reduction, Observability, and Automation → Hands-On for Logging-Based Metrics

### Audience Context: IT Engineers and Developers

All steps follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

Logging-based metrics convert **log events** into **numerical metrics** that can be visualized in dashboards and used in alarms.
This hands-on lab teaches participants how to:

* Write Logging Query Language (LQL) queries,
* Extract structured fields from logs,
* Convert log patterns into metrics,
* Plot the metrics on a dashboard.

This skill becomes essential when default OCI metrics are insufficient for application reliability needs.

---

# 2. Objectives

* Create a log search query using LQL.
* Filter and parse log entries.
* Convert query results into custom metrics.
* View and validate the metric.
* Add log-derived metrics into a dashboard.

---

# 3. Prerequisites

### OCI Requirements

* Compute instance or application generating logs.
* System or application logs enabled.
* Logging and Monitoring permissions.

### Knowledge Requirements

* Basic understanding of logs and LQL syntax.

---

# 4. Architecture / Diagram

```
Log Stream → LQL Query → Metric Extraction → Dashboard / Alarm
```

---

# 5. Step-by-Step Procedure

## Step 1: Open Log Explorer

1. Open OCI Console.
2. Navigate to:
   **Observability & Management → Logging → Log Explorer**.
3. Select the correct Log Group.
4. Select your log source:

   * Compute instance logs
   * Application logs
   * Custom file paths

Confirm recent log entries are visible.

---

## Step 2: Identify Log Pattern for Metric Extraction

Look for meaningful patterns such as:

* ERROR messages
* HTTP 5xx responses
* Timeout keywords

Example log entry:

```
2025-11-19 13:42:11 ERROR /checkout orderId=492 timeout
```

You will extract a metric counting the number of such errors.

---

## Step 3: Write an LQL Query

1. In Log Explorer, switch to **LQL** mode.
2. Write a query to filter error events:

```
filter logLevel = "ERROR"
| stats count() as errorCount by bin(1m)
```

### Breakdown:

* `filter` selects matching logs.
* `stats count()` aggregates errors.
* `bin(1m)` groups counts into 1‑minute intervals.

Click **Run Query**.

---

## Step 4: (Optional) Parse Log Fields

If log entries contain structured data, extract fields:

Example log:

```
ERROR checkout_failed orderId=123 reason=timeout
```

LQL parse example:

```
filter message contains "checkout_failed"
| parse message "* orderId=* reason=*" as logPrefix, orderId, reason
| stats count() by bin(1m), reason
```

Parsing helps create metrics based on:

* failure types,
* specific routes,
* specific event reasons.

---

## Step 5: Create a Logging-Based Metric

1. After running the LQL query, click **Create Metric**.
2. Enter:

   * **Metric Name**: `checkout_error_count`
   * **Namespace**: `custom.logging.metrics`
   * **Description**: `Counts checkout failures per minute`
3. Choose metric dimensions from parsed fields (if applicable).
4. Save the metric.

### Verify

Metric appears in Monitoring under `custom.logging.metrics`.

---

## Step 6: Validate the Metric in Metric Explorer

1. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**.
2. Select Namespace: `custom.logging.metrics`.
3. Select Metric: `checkout_error_count`.
4. Apply any required dimensions.
5. Choose Statistic: `sum`.

### Verify

A time-series chart should appear showing error counts per minute.

---

## Step 7: Add the Metric to a Dashboard

1. Navigate to:
   **Observability & Management → Dashboards**.
2. Open an existing dashboard or create a new one.
3. Click **Add Widget → Metric Chart**.
4. Choose:

   * Namespace: `custom.logging.metrics`
   * Metric: `checkout_error_count`
5. Set the title:

   * `Checkout Error Count (Logging-Based Metric)`
6. Save widget.

---

# 6. Expected Output / Verification

You should now have:

* A working LQL query for filtering log patterns.
* A new log-derived metric created.
* Metric visible in Metric Explorer.
* Metric added to your dashboard.

Verification Checklist:

```
[ ] LQL query working
[ ] Metric created successfully
[ ] Metric appears under custom namespace
[ ] Metric plotted in dashboard
```

---

# 7. Troubleshooting Guidelines

**Query returns no results:**

* Check log group/compartment.
* Remove filters temporarily.
* Ensure log timestamps fall within query window.

**Metric not appearing:**

* Refresh Metric Explorer.
* Ensure correct namespace selected.
* Wait 1–2 minutes for metric ingestion.

**Dashboard panel empty:**

* Confirm metric has data points.
* Check dimensions.
* Verify time range.

---

# 8. Best Practices Learned

* Use structured logs to simplify parsing.
* Use `bin()` for consistent time buckets.
* Keep log queries simple and efficient.
* Create metrics only for important patterns.
* Use log-based metrics to complement default OCI metrics.

---

# 9. Additional Notes

* These metrics will be used in Day 4 for resilience and alerting.
* Logging-based metrics are powerful for SRE because they surface application-level issues not visible in infrastructure metrics.
