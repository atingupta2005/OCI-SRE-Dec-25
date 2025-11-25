
## Hands-on Lab

This version is designed **for students**. It guides them through documenting SLIs and defining SLOs **with detailed explanations**. A **solution key** is provided at the end so learners can compare their answers.


## **📘 PART 1 — Student Activity**

You are working with the **Class Enrollment Web App**, which supports:

* Student login & course browsing
* Enrollment into classes
* Teachers viewing/editing grades
* Admin managing users, classes, and enrollment data

Your task is to:

1. Document **SLIs** (Service Level Indicators)
2. Choose **SLOs** (Service Level Objectives)

Keep answers short but clear.


## 1. Document Your SLIs

Use the templates below.


## SLI 1 – Availability

**Your definition:**
(Write what availability means for this app.)


## SLI 2 – Latency

**Your definition:**
(Define how fast the system should respond.)


## SLI 3 – Error Rate (Optional)

**Your definition:**
(Define what percentage of requests can fail.)


## SLI 4 – Business Success Rate (Optional)

**Your definition:**
(Define how often enrollment actions succeed.)


## 2. Define Your SLOs (Targets + Short Notes)


## SLO for SLI 1 (Availability)

**Target:**

**Short rationale:**


## SLO for SLI 2 (Latency)

**Target:**

**Short rationale:**


## SLO for SLI 3 (Error Rate – Optional)

**Target:**

**Short rationale:**


## SLO for SLI 4 (Business Success Rate – Optional)

**Target:**

**Short rationale:**


## **📘 PART 2 — Solutions Key (Instructor Reference at End)**

Students should NOT look at this section until their answers are completed.


## ✔ Solution Key — Suggested SLIs and SLOs

Below are well‑reasoned sample answers. Students may write slightly different definitions — that is fine if their reasoning is logical.


## 1. Example SLIs

## SLI 1 – Availability (Recommended)

**Definition:**
“Percentage of successful responses (2xx/3xx) from the critical endpoints `/login`, `/courses`, and `/enroll`.”

**Why:**
If students or teachers cannot reach these endpoints, the system is effectively down.


## SLI 2 – Latency (Recommended)

**Definition:**
“Percentage of requests to `/courses` and `/enroll` served under **400 ms at P95**.”

**Why:**
These actions involve user decisions. High latency frustrates students and slows teachers.


## SLI 3 – Error Rate (Recommended)

**Definition:**
“Percentage of API requests returning 5xx responses across all backend endpoints.”

**Why:**
5xx failures mean system faults — not user mistakes.


## SLI 4 – Business Success Rate (Optional)

**Definition:**
“Percentage of successful enrollment attempts that complete without system errors.”

**Why:**
Enrollment is the core business action; failures directly impact learning outcomes.


## 2. Example SLOs (Targets + Rationale)

## SLO for SLI 1 – Availability

**Target:** **99.5%** availability

**Rationale:**
This is an educational system, not a financial trading platform. 99.5% is reliable enough while allowing planned maintenance.


## SLO for SLI 2 – Latency

**Target:** **95% of requests under 400 ms**

**Rationale:**
Fast page loads help students browse and enroll efficiently. 400 ms is a reasonable P95 target for an academic system.


## SLO for SLI 3 – Error Rate

**Target:** **< 1% 5xx errors**

**Rationale:**
Most errors should be user‑generated (4xx). Server failures must be rare.


## SLO for SLI 4 – Business Success Rate

**Target:** **98% successful enrollments**

**Rationale:**
Enrollment errors undermine trust, but occasional failures during peak periods may occur.


## End of Student Document with Solutions Key
