# Day 1 – OCI Core Architecture

## Hands-On: Working with OCI Core Services

## Task 1: Create a VCN and Subnet

You will create a basic Virtual Cloud Network (VCN) with one public subnet.

### Steps

1. Open the **Navigation Menu**.
2. Go to **Networking → Virtual Cloud Networks**.
3. Click **Create VCN**.
4. Choose **VCN with Internet Connectivity** (recommended for beginners).
5. Provide:

   * **VCN Name:** `day1-vcn`
   * **CIDR Block:** pre-filled (keep default)
6. Click **Next** and then **Create**.

### Result

OCI automatically creates:

* VCN
* Public Subnet
* Internet Gateway
* Route Table
* Security List

This gives you a ready-to-use network.

---

## Task 2: Launch a Compute Instance

### Steps

1. Open **Navigation Menu → Compute → Instances**.
2. Click **Create Instance**.
3. Enter:

   * **Name:** `day1-instance`
4. Choose an image:

   * **OS:** Oracle Linux latest version
5. Choose shape:

   * For training: `VM.Standard3.Flex`
   * Set OCPUs: `1`
   * Memory: `4 GB`
6. Under **Networking**:

   * Select the VCN you created: `day1-vcn`
   * Select its public subnet
   * Ensure **Assign Public IP** = Yes
7. Leave defaults and click **Create**.

### Result

The instance launches and receives a public IP required for SSH.

---

## Task 3: Use Cloud Shell to SSH into the Instance

Cloud Shell provides a browser-based terminal, so you don’t need local tools.

### Steps

1. Click the **Cloud Shell icon** (top-right of OCI Console).
2. Wait for the shell to initialize.
3. Run the command below to connect (replace with your instance’s public IP from the console):

```
ssh opc@<PUBLIC-IP>
```

4. When prompted, type `yes` and press Enter.
5. You should now see a Linux command prompt from your VM.

### Result

Connection confirms your VCN, subnet, and compute setup all work.

---

## Task 4: Create an IAM Group and Policy

IAM is needed to control access to OCI resources.

### Part A — Create a Group

1. Open **Navigation Menu → Identity & Security → Domains → Default → Groups**.
2. Click **Create Group**.
3. Name it: `day1-training-group`.
4. Click **Create**.

### Part B — Create a Policy for the Group

1. Open **Navigation Menu → Identity & Security → Policies**.
2. Click **Create Policy**.
3. Name: `day1-training-policy`.
4. Select the same compartment where your resources exist.
5. Add this policy statement:

```
Allow group day1-training-group to inspect all-resources in compartment <YOUR-COMPARTMENT-NAME>
```

6. Click **Create**.

### Result

The new group now has permission to view all resources in the selected compartment.

---

# Notes

* These tasks form the core workflow used in Day 2 and Day 3 hands-on sessions.
* Make sure you can repeat these steps confidently.
