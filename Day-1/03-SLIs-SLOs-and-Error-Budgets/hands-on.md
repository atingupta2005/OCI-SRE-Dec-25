# Day 1 – SLIs, SLOs, and Error Budgets

## Hands-On: Defining SLIs and Setting SLO Targets

## Scenario

You are responsible for a fictional web service:
**"checkout.example.com"**

This service processes online purchases for users.

Your task is to select the right SLIs and define SLO targets that reflect reliability expectations for end-users.

---

## Step 1: Define SLIs for the Web Service

Choose **2–3 measurable indicators** that best represent the reliability of the checkout service.

Use the guidance below to help define them.

### Common SLI Categories

* **Availability**: Is the service reachable?
* **Latency**: How long does it take to respond?
* **Error rate**: How often does the service return errors?

### Define Your SLIs (Fill these out)

1. **SLI 1 – Availability**
   Example definition: “Percentage of successful responses (2xx) over all requests.”

2. **SLI 2 – Latency**
   Example definition: “Percentage of requests served under 300 ms at P95.”

3. **SLI 3 – Error Rate** (optional)
   Example definition: “Percentage of failed requests (5xx).”

Write your own definitions based on these examples.

---

## Step 2: Set SLO Targets with Rationale

For each SLI you defined above, assign an SLO target.

### Example Format

* **Availability SLO**: 99.9%
  Rationale: Checkout is a critical revenue-generating service.

* **Latency SLO**: 95% requests < 300 ms
  Rationale: Slow checkout leads to drop-offs.

* **Error Rate SLO**: < 0.2%
  Rationale: Errors directly impact conversions.

### Fill Out Your SLOs

1. **SLO for SLI 1:**
   **Rationale:**

2. **SLO for SLI 2:**
   **Rationale:**

3. **SLO for SLI 3 (optional):**
   **Rationale:**

---

# Notes

* This hands-on focuses only on SLIs and SLOs.
* Error budget calculation is **conceptual only**
* Your SLI/SLO definitions will be used in later exercises on monitoring and alerting.
