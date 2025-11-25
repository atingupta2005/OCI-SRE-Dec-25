
## Hands-on Lab

## Hands-On Exercise: Defining SLIs and Setting SLO Targets (Instructor-Optimized Version)

## 1. Scenario Overview

You are responsible for a fictional production service:

### **📌 checkout.example.com**

This service processes customer purchases. Any slowdowns or failures directly impact:

* user experience
* revenue
* business reputation

Your task today:

* Choose **appropriate SLIs** (what to measure)
* Define **SLO targets** (expected reliability level)
* Justify *why* you chose those numbers

This is the foundation for future topics: monitoring, alerting, incident response, and error budgets.


## 2. Step 1: Define SLIs (Service Level Indicators)

### Purpose: Identify the most important signals that describe user experience.

SLIs should be:

* **Measurable**
* **User-centric**
* **Aligned with business impact**

### Common SLI Categories Explained

* **Availability** → “Can users reach the service?”
* **Latency** → “Is the checkout fast enough for users to complete purchases?”
* **Error Rate** → “How often does the service return failure responses?”

These are the three pillars of user experience for a checkout system.


## Define Your SLIs (with templates + guidance)

Below are enhanced descriptions explaining why each SLI category fits a checkout workload.

### 1. SLI 1 – Availability

Example definition:

> “Percentage of requests that receive a valid 2xx response.”

**Why it matters:** If checkout is unavailable, users cannot complete purchases—this directly impacts revenue.

### 2. SLI 2 – Latency

Example definition:

> “Percentage of requests completed under 300 ms for P95.”

**Why it matters:** Checkout must be snappy. High latency leads to cart abandonment.

### 3. SLI 3 – Error Rate (Optional)

Example definition:

> “Percentage of requests returning 5xx errors.”

**Why it matters:** Even small spikes in errors translate to lost sales.


### **📝 Student Activity: Write Your Own SLIs**

Use the templates and explanations above to write real SLIs for the service.

1. **SLI 1 – Availability:**
   *Your definition:*

2. **SLI 2 – Latency:**
   *Your definition:*

3. **SLI 3 – Error Rate (Optional):**
   *Your definition:*


## 3. Step 2: Set SLO Targets with Clear Rationale
 - Rationale refers to the underlying reasons, justifications, and thought processes behind specific decisions, actions, practices, or beliefs

### Purpose: Convert SLIs into measurable reliability goals.

SLOs must:

* reflect user expectations
* match business impact
* be realistic to maintain

Don’t choose numbers because “99.999% looks good.”
Choose numbers that balance **reliability vs. development speed**, which is the core philosophy of SRE.


## Example SLO Format (with strong explanations)

* **Availability SLO: 99.9%**
  **Why:** Checkout is revenue-critical but can tolerate small, infrequent downtime.

* **Latency SLO: 95% < 300 ms**
  **Why:** Most users expect quick checkout; latency beyond 300 ms increases drop-offs.

* **Error Rate SLO: < 0.2%**
  **Why:** Even minor error spikes lead to immediate purchase failures.


## **📝 Student Activity: Define SLOs with Rationale**

Use realistic numbers based on what a production service should maintain.

1. **SLO for SLI 1 (Availability):**
   **Rationale:**

2. **SLO for SLI 2 (Latency):**
   **Rationale:**

3. **SLO for SLI 3 (Error Rate - Optional):**
   **Rationale:**


## 4. Additional Guidance for Students (How to Think Like an SRE)

Here are some hints to help you refine your SLIs/SLOs:

### Think in terms of user impact

* Would this metric matter to the customer using checkout?

### Avoid vanity metrics
 - Measurements that look impressive on the surface but do not provide meaningful, actionable insights into the actual reliability, performance, or health of a system or the service provided to users

* CPU usage is *not* an SLI.
* Disk I/O is *not* an SLI.

SLIs must reflect **user-facing reliability**, not internal server conditions.

### Be careful with strict SLOs

Unrealistic SLOs (like 99.999% for everything) lead to:

* alert fatigue
* unnecessary stress
* wasted engineering effort

SLOs must be **set with purpose**, not ambition.

### Remember error budgets

You will calculate these later, but keep this in mind now:

* Higher SLO → smaller error budget
* Smaller error budget → less room for deployments or risky changes


## 5. Notes for Instructors and Students

* This hands-on is foundational; SLIs/SLOs influence alerting, monitoring, and incident response later.
* Focus today on reasoning—not precision numbers.
* Your SLIs/SLOs will be reused in Day 2 exercises on dashboards and error budgets.

