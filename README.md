# Terraform-Azure-Resources
This project sets up Azure infrastructure with a resource group, storage account, virtual network (2 subnets), 2 Linux VMs with NGINX (via custom script), public IPs, NSGs, MSSQL Server and DB, and a Key Vault storing VM and DB credentials.

## Azure Infrastructure Deployment

This project delivers a robust and secure Azure infrastructure environment designed to support scalable web applications and enterprise-grade data management. Leveraging Azure best practices, the deployment incorporates a well-architected network topology, hardened compute resources, and secure secrets management.

Key features include isolated subnets, secure VM provisioning, and centralized secret storage for admin credentials. The setup enables automated deployment while ensuring flexibility, security, and maintainability in cloud environments.

---

## 📦 Resources Overview

Below is a summary of all Azure resources deployed in this infrastructure, with one-liners for clarity.

### 🗂️ Resource Group
- **Name:** `rg-prod`  
  ➤ Logical container for managing all Azure resources in a unified group.

### ☁️ Storage Account
- **Name:** `storageaccount43533`  
  ➤ Used for storing diagnostics logs or other general-purpose storage.

### 🌐 Virtual Network
- **Name:** `application-vnet`  
  ➤ Provides isolated, secure network environment for VMs and services.

- **Subnets:**
  - `frontend-subnet`  
    ➤ Hosts the frontend VM that serves web traffic.
  - `backend-subnet`  
    ➤ Hosts backend VM and database, isolated from the public internet.

### 🌍 Public IP Addresses
- `frontend-pip`  
  ➤ Assigned to `Frontend-VM` for public access (e.g., HTTP/HTTPS).
- `backend-pip`  
  ➤ Assigned to `Backend-VM` for secure access, if needed.

### 🔐 Network Security Groups (NSGs)
- `frontend-nsg`  
  ➤ Controls inbound/outbound traffic for `frontend-subnet`.  
  ➤ Allows inbound SSH (port 22) for secure VM access and HTTP (port 80) for web traffic.

- `backend-nsg`  
  ➤ Secures backend subnet by controlling traffic.  
  ➤ Allows inbound SSH (port 22) for management; HTTP (port 80) typically restricted based on need.

### 🖥️ Linux Virtual Machines
- `Frontend-VM`  
  ➤ Frontend server with NGINX installed automatically via custom script.
- `Backend-VM`  
  ➤ Backend server also pre-configured with NGINX.

- **Authentication:**
  - Username secret: `vmusername-02`
  - Password secret: `vmpassword-02`
  ➤ Stored in Key Vault to secure VM credentials.

### 🗄️ Azure SQL Server & Database
- **SQL Server Name:** `sqlserver873245`  
  ➤ Hosts the SQL database used by backend applications.
- **Database Name:** `sqldatabase8734`  
  ➤ Stores application data securely and scalably.

- **Admin credentials (in Key Vault):**
  - Username: `sql-server-admin-username-02`
  - Password: `sql-server-admin-password-02`

### 🔑 Azure Key Vault
- **Name:** `keyvault3534784`  
  ➤ Centralized secure storage for sensitive secrets and credentials.

- **Stored Secrets:**
  - `vmusername-02`: Linux VM admin username
  - `vmpassword-02`: Linux VM admin password
  - `sql-server-admin-username-02`: SQL Server admin username
  - `sql-server-admin-password-02`: SQL Server admin password

---

## 🔐 Security Features

- 🔒 Secrets are stored securely in Key Vault — never hardcoded.
- 🔐 NSGs limit access to required ports (SSH, HTTP, etc.).
- 🌐 Public IPs provide controlled access only where needed.

---

## 🧾 Notes

- NGINX auto-installed on both VMs using custom data at deployment.
- Key Vault secrets are referenced dynamically by deployment scripts.
- Ensure proper Key Vault access policies are in place for automation identities.

---

## 🛠️ Technologies Used

- ✅ Azure Virtual Machines (Linux)
- ✅ Azure Virtual Network & Subnets
- ✅ Azure Public IPs & NSGs
- ✅ Azure SQL Server & SQL Database
- ✅ Azure Key Vault
- ✅ Azure Storage Account

---

## 🚀 Deployment Instructions

### Terraform

```bash
terraform init
terraform plan
terraform apply
