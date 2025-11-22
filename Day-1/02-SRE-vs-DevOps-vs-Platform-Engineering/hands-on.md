# **Day 1 – SRE vs DevOps vs Platform Engineering**

## **Hands-On Exercise: Role Comparison (Structured, Teaching-Friendly Version)**

# **1. Objective of This Exercise**

By the end of this session, learners will:

* Understand how SRE, DevOps, and Platform Engineering differ in responsibilities
* Recognize where the roles overlap and where they diverge
* Build a mental model that will help them in later discussions about reliability, deployments, tooling, and incident management

This exercise is intentionally simple but conceptually powerful.

---

# **2. Step 1: Prepare a Comparison Table**

### **Purpose:** Establish a structured way to compare the three roles.

Students should draw a simple three-column table like this:

```
+------------------------+------------------------+------------------------------+
|         SRE            |         DevOps         |     Platform Engineering     |
+------------------------+------------------------+------------------------------+
```

You will fill this table in the next step.

---

# **3. Step 2: Populate the Table with Example Tasks**

### **Purpose:** See how each role contributes differently to modern engineering teams.

Below are curated example tasks. Students should copy them into the table under the appropriate columns.

---

## **SRE Responsibilities**

Below are core SRE tasks along with explanations for **why each task fits the role**. Additional tasks are included to give learners a broader understanding.

### Core SRE Tasks (with explanations)

* **Define SLIs and SLOs** — SREs own reliability targets and ensure they reflect user experience.
* **Respond to incidents and lead blameless postmortems** — SREs specialize in operational excellence and learning from failures.
* **Implement monitoring, alerting, and reliability dashboards** — Observability is essential for meeting reliability goals.
* **Reduce operational toil through automation** — Toil reduction is a pillar of SRE culture.
* **Engineer reliability improvements** — SREs make architectural or systemic changes that reduce risk long-term.

### Additional Recommended SRE Tasks (with explanations)

* **Capacity planning and forecasting** — Ensures the system can handle load safely; deeply linked to reliability.
* **Chaos testing and failure injection** — Helps validate system resilience under controlled failures.
* **Error budget management** — SREs use error budgets to balance reliability vs. innovation.
* **Developing runbooks and playbooks** — Documents operational best practices for consistent incident response.
* **Load testing and stress testing** — Identifies bottlenecks before failures occur.

### Hints for Students to Add More Tasks

* Think of **anything related to reliability, resilience, availability, or incident response**.
* If the task involves **reducing risk**, it likely fits SRE.
* If the task reduces repetitive manual work, it also fits SRE.
  These tasks represent the reliability-focused nature of the SRE discipline:
* Define SLIs and SLOs
* Respond to incidents and lead blameless postmortems
* Implement monitoring, alerting, and reliability dashboards
* Reduce operational toil through automation
* Improve system reliability through engineering changes

These responsibilities emphasize **availability, performance, and operational excellence**.

---

## **DevOps Responsibilities**

DevOps focuses on improving software delivery speed, automation, and consistency. Below are tasks with explanations.

### Core DevOps Tasks (with explanations)

* **Manage CI/CD pipelines** — CI/CD is the backbone of DevOps automation.
* **Automate build and deployment workflows** — DevOps enables fast, reliable delivery cycles.
* **Maintain infrastructure-as-code (IaC) scripts** — Ensures environments are reproducible.
* **Optimize development workflow automation** — DevOps removes friction for developers.
* **Ensure consistency across environments** — Prevents the classic "works on my machine" issues.

### Additional Recommended DevOps Tasks (with explanations)

* **Implement containerization (Docker, OCI, etc.)** — Standardizes application packaging.
* **Manage artifact repositories (e.g., OCIR)** — Ensures secure and consistent versioned releases.
* **Create and maintain deployment pipelines for canary/blue-green releases** — Supports safe rollouts.
* **Integrate automated testing frameworks** — Ensures reliability of builds before deployment.
* **Coordinate release processes with development and SRE teams** — Facilitates smooth production releases.

### Hints for Students to Add More Tasks

* Any task related to **release engineering**, **automation**, or **developer tooling** likely belongs here.
* If the task improves **speed of delivery** or **reduces deployment friction**, it fits DevOps.
  These tasks support fast, safe, consistent software delivery:
* Manage CI/CD pipelines
* Automate build and deployment workflows
* Maintain infrastructure-as-code scripts
* Optimize development workflow automation
* Ensure consistency of application environments

These responsibilities emphasize **tooling, deployment automation, and developer productivity**.

---

## **Platform Engineering Responsibilities**

Platform Engineering builds the internal platforms that development, DevOps, and SRE rely on.

### Core Platform Engineering Tasks (with explanations)

* **Build internal developer platforms/portals** — Provides a unified experience for developers.
* **Provide reusable infrastructure modules** — Reduces duplication and ensures compliance.
* **Build self-service tools for developers** — Enables teams to provision resources independently.
* **Standardize infrastructure and deployment patterns** — Improves security and reduces variability.
* **Maintain platform performance, cost efficiency, and scalability** — Ensures the platform can serve teams reliably.

### Additional Recommended Platform Engineering Tasks (with explanations)

* **Design and maintain golden paths for developers** — Standard workflows accelerate team velocity.
* **Build custom Kubernetes operators or internal controllers** — Enhances platform automation.
* **Integrate authentication, secrets management, and policy enforcement** — Ensures organization-wide security.
* **Operate internal PaaS offerings (Kafka, Redis, DBaaS, etc.)** — Provides reliable shared services.
* **Create and maintain service templates and scaffolding tools** — Standardizes service creation.

### Hints for Students to Add More Tasks

* Think of tasks that **multiple teams would use**.
* Anything that creates **platforms, abstractions, or reusable components** belongs here.
* Platform Engineering often owns the tools SRE and DevOps build on top of.

Platform engineers build the internal platforms that DevOps and SRE workflows depend on:

* Create internal developer platforms and portals
* Provide reusable infrastructure modules and templates
* Build self-service tools for developers
* Standardize infrastructure and deployment patterns
* Maintain platform performance, cost efficiency, and scalability

These responsibilities emphasize **platform creation, abstraction, and enabling teams at scale**.

---

# **4. How Students Should Use the Table**

The final filled table will help learners:

* Visually separate and compare each role
* Identify areas of collaboration (e.g., SRE + DevOps during incidents; SRE + Platform for observability integration)
* Understand which role focuses on **operations**, which on **delivery**, and which on **platform enablement**

This table becomes a reference point in later modules on:

* incident response workflows
* CI/CD and automation
* SLO implementation
* platform reliability

---

# **5. Key Notes for Learners**

* SRE, DevOps, and Platform Engineering are **complementary**, not competing roles.
* Each role has a different focus area, but all three aim to improve engineering productivity and system reliability.
* You will see these boundaries again when we discuss on-call, SLIs/SLOs, and postmortems.

