# 📦 Azure Resource Dependencies

This document outlines the logical provisioning order and infrastructure dependencies for the Azure deployment. It ensures all resources are created in the correct sequence and linked properly for successful operation and automation.

---

## 🧩 Dependency Hierarchy

- **Resource Group (`rg-prod`)** ➝
  - **Storage Account**  
    ↳ `storageaccount43533`

  - **Virtual Network**  
    ↳ `application-vnet` ➝  
    &nbsp;&nbsp;&nbsp;&nbsp;↳ `frontend-subnet`  
    &nbsp;&nbsp;&nbsp;&nbsp;↳ `backend-subnet`

  - **Network Security Groups**  
    ↳ `frontend-nsg`  
    ↳ `backend-nsg`

  - **Public IP Addresses**  
    ↳ `frontend-pip`  
    ↳ `backend-pip`

  - **Network Interfaces (NICs)**  
    ↳ Depend on:  
    &nbsp;&nbsp;&nbsp;&nbsp;• Subnet  
    &nbsp;&nbsp;&nbsp;&nbsp;• NSG  
    &nbsp;&nbsp;&nbsp;&nbsp;• Resource Group

  - **Key Vault**  
    ↳ `keyvault3534784` ➝  
    &nbsp;&nbsp;&nbsp;&nbsp;• Secrets  
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↳ `vmusername-02`, `vmpassword-02`  
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↳ `sql-server-admin-username-02`, `sql-server-admin-password-02`

  - **SQL Server**  
    ↳ `sqlserver873245`  
    ↳ Depends on:  
    &nbsp;&nbsp;&nbsp;&nbsp;• Resource Group  
    &nbsp;&nbsp;&nbsp;&nbsp;• Key Vault  
    &nbsp;&nbsp;&nbsp;&nbsp;• Secrets

    ↳ SQL Database  
    &nbsp;&nbsp;&nbsp;&nbsp;↳ `sqldatabase8734`

  - **Linux Virtual Machines**  
    ↳ `Frontend-VM`  
    ↳ `Backend-VM`  
    ↳ Depend on:  
    &nbsp;&nbsp;&nbsp;&nbsp;• Subnet  
    &nbsp;&nbsp;&nbsp;&nbsp;• NIC  
    &nbsp;&nbsp;&nbsp;&nbsp;• Public IP  
    &nbsp;&nbsp;&nbsp;&nbsp;• Key Vault  
    &nbsp;&nbsp;&nbsp;&nbsp;• Key Vault Secrets

---

## 📌 Notes

- This dependency order is especially important when using Infrastructure as Code (e.g., Terraform or Bicep).
- Managing these dependencies properly ensures secure, modular, and maintainable deployments.

