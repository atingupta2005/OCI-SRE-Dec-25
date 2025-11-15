# Day 1 – SRE Fundamentals and OCI Foundations

## Hands-On Lab: OCI Core Architecture

### TOC Reference: Day 1 → SRE Fundamentals and OCI Foundations → Hands-On for OCI Core Architecture

### Audience Context: IT Engineers and Developers

All steps in this lab follow the latest OCI Console interface at the time of writing.

---

# 1. Background and Purpose

This hands-on lab provides practical understanding of **OCI’s core networking, compute, and load balancing architecture**. IT engineers and developers will create a minimal but production-aligned environment that demonstrates:

* VCN design (public and private subnets)
* Routing and gateways
* Compute deployment patterns
* Load balancer integration
* High-availability placement
* Basic observability signals

This lab forms the architectural foundation for later SRE practices such as health checks, autoscaling, SLO-based metrics, and incident diagnostics.

---

# 2. Objectives

* Create a Virtual Cloud Network (VCN) with required subnets.
* Configure routing and gateways using current OCI UI.
* Deploy compute instances across availability domains.
* Attach compute to a load balancer backend set.
* Validate connectivity and health checks.
* Observe core metrics and logs.

---

# 3. Prerequisites

### OCI Requirements

* Appropriate IAM permissions for:

  * Networking (VCN, subnets, route tables)
  * Compute (Instance creation)
  * Load Balancer
  * Monitoring & Logging

### Environment Requirements

* No pre-existing environment is required; this lab builds a fresh setup.

### Knowledge Requirements

* Understanding of IP addressing.
* Basic Linux usage.

---

# 4. Architecture / Diagram

The environment you will build:

```
                       +-----------------------+
                       |       Compartment     |
                       +-----------+-----------+
                                   |
                                   v
                    +-----------------------------+
                    |     VCN (10.0.0.0/16)       |
                    +--------------+--------------+
                                   |
         +-------------------------+-------------------------+
         |                                                   |
         v                                                   v
 +-------------------+                               +-------------------+
 | Public Subnet     |                               | Private Subnet    |
 | 10.0.1.0/24       |                               | 10.0.2.0/24       |
 +---------+---------+                               +---------+---------+
           |                                                   |
           v                                                   v
   [OCI Load Balancer]                                  [Compute VM 1]
           |                                                   |
           v                                                   |
   [Backend Set → Private IP]                                 v
                                                       [Compute VM 2]
```

---

# 5. Step-by-Step Procedure

## Step 1: Create a New VCN (Latest OCI UI)

1. Open OCI Console.
2. Navigate to: **Networking → Virtual Cloud Networks**.
3. Click **Create VCN**.
4. Choose **VCN with Internet Connectivity**.
5. Provide:

   * Name: `day1-sre-vcn`
   * CIDR Block: `10.0.0.0/16`
6. Ensure the wizard creates:

   * Internet Gateway
   * Route Table (for public subnet)
   * Security Lists
   * Public Subnet
7. Click **Create**.

### Verify

* VCN appears in the list.
* Public subnet created automatically.

---

## Step 2: Create a Private Subnet

1. Inside your VCN, go to **Subnets**.
2. Click **Create Subnet**.
3. Name: `private-subnet`
4. Subnet Type: **Private Subnet**
5. CIDR: `10.0.2.0/24`
6. Route Table: Create a **new route table**.
7. Add Route Rule:

   * Target Type: **NAT Gateway**
   * Destination CIDR: `0.0.0.0/0`
8. Security List:

   * Allow ingress from LB subnet for port 80 or 443.

### Verify

* Subnet created.
* No public IP assignment enabled.

---

## Step 3: Create NAT Gateway

1. Go to **Gateways** in the VCN.
2. Click **Create NAT Gateway**.
3. Name: `day1-nat-gateway`.
4. Attach to new/existing route table.

### Why

* Private instances need outbound Internet for OS updates.

---

## Step 4: Launch Compute Instances in Private Subnet

1. Navigate to: **Compute → Instances**.
2. Click **Create Instance**.
3. Configure:

   * Name: `app-vm-1`
   * Availability Domain: AD1
   * Shape: Flexible VM
   * Image: Latest Oracle Linux
   * Networking: Select `private-subnet`
   * Public IP: **Do not assign**
4. Add SSH key.
5. Launch.

Repeat for a second instance:

* Name: `app-vm-2`
* AD2 (if available)

### Validate Compute Health

1. After launch, open instance details.
2. Confirm **State = RUNNING**.
3. Check the **Console Logs** for boot issues.

---

## Step 5: Install a Simple Web Server (Optional but Recommended)

SSH via **Bastion** or **VCN access**.

```
sudo dnf install -y nginx
sudo systemctl enable --now nginx
```

Check local health:

```
curl localhost
```

---

## Step 6: Create OCI Load Balancer

1. Navigate to: **Networking → Load Balancers**.
2. Click **Create Load Balancer**.
3. Select **Public LB**.
4. Shape: `flexible`
5. Subnets:

   * Use the **public subnet**
6. Create Backend Set:

   * Name: `app-backend`
   * Health Check: HTTP, port 80, path `/`
7. Add Backends:

   * Select both `app-vm-1` and `app-vm-2`
   * Use private IPs
8. Add Listener:

   * Protocol: HTTP
   * Port: 80

### Verify Backend Health

1. Go to **Backend Set → Health Status**.
2. Ensure both instances show **OK**.

---

## Step 7: Validate Application Access

1. Copy the Load Balancer’s public IP.
2. Access in browser:

```
http://<LB_PUBLIC_IP>
```

3. Ensure the NGINX welcome page loads.

Optional: Refresh repeatedly to observe backend rotation.

---

## Step 8: Observe Metrics and Logs

### Load Balancer Metrics

1. Navigate to:
   **Observability & Management → Monitoring → Metric Explorer**
2. Query namespace: `oci_lbaas`
3. Observe:

   * `BackendHealthyHostCount`
   * `BackendResponseTime`
   * `HttpResponseCounts`

### Compute Metrics

1. Navigate to:
   **Compute → Instances → Metrics**
2. Check:

   * CPU Utilization
   * Memory (with Cloud Agent)
   * Network traffic

### Logging

1. Navigate to:
   **Observability & Management → Logging → Log Explorer**
2. Filter for:

   * NGINX logs (if configured)
   * System logs
   * Flow logs (if enabled)

---

# 6. Expected Output / Verification

You should be able to verify:

* VCN with public + private subnets configured correctly.
* Private instances reachable via LB.
* Load balancer shows **Healthy** backend hosts.
* Web content accessible via LB public IP.
* Metrics visible for LB and Compute.
* Logs available for system components.

Verification checklist:

```
[ ] Backend Healthy Host Count = 2
[ ] LB listener active on port 80
[ ] Instances deployed in separate ADs
[ ] NAT + routing functional
[ ] Compute metrics visible
```

---

# 7. Troubleshooting Guidelines

**Backend health check failing:**

* Check NGINX service status.
* Check security list for private subnet (port 80 from LB subnet).
* Verify instance is in RUNNING state.

**Can’t reach LB public IP:**

* Verify public subnet route table has default route to Internet Gateway.
* Check security lists allow ingress from 0.0.0.0/0.

**No compute metrics:**

* Ensure Cloud Agent is enabled.
* Restart the monitoring agent.

**No logs visible:**

* Confirm logging is enabled and correct compartment is selected.

---

# 8. Best Practices Learned

* Deploy compute across Availability Domains for resilience.
* Place backends in private subnets for security.
* Use NAT gateway for controlled outbound access.
* Always verify health checks and LB reachability.
* Monitor both compute and LB behaviour for reliability signals.

---

# 9. Additional Notes

* This lab forms the basis for later exercises involving autoscaling, fault injection, and resilience validation.
* Understanding core OCI networking helps prevent misconfiguration-related outages.
