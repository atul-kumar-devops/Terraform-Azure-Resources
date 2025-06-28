module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name = "rg-prod"
  location            = "westus2"
}

module "storage_aacount" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_storage_account"

  resource_group_name  = "rg-prod"
  storage_account_name = "storageaccount43533"
  location             = "westus2"
}

module "sql_server_login_uersname" {
  depends_on = [module.key_vault]
  source     = "../../modules/azurerm_key_vault_secret"

  key_vault_secret_name  = "sql-server-admin-username-02"
  key_vault_secret_value = "server98754"
  key_vault_name         = "keyvault3534784"
  resource_group_name    = "rg-prod"
}

module "sql_server_login_password" {
  depends_on = [module.key_vault]
  source     = "../../modules/azurerm_key_vault_secret"

  key_vault_secret_name  = "sql-server-admin-password-02"
  key_vault_secret_value = "Adminuser@123"
  key_vault_name         = "keyvault3534784"
  resource_group_name    = "rg-prod"
}


module "sql_server" {
  depends_on = [module.resource_group, module.key_vault, module.sql_server_login_uersname, module.sql_server_login_password]
  source     = "../../modules/azurerm_database_server"

  sql_server_name     = "sqlserver873245"
  location            = "westus2"
  resource_group_name = "rg-prod"
  mssql_version       = "12.0"

  key_vault_name = "keyvault3534784"


  sql_server_username_key = "sql-server-admin-username-02"
  sql_server_password_key = "sql-server-admin-password-02"
}

module "sql_database" {
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_mssql_database"

  mssql_database_name = "sqldatabase8734"
  resource_group_name = "rg-prod"
  sql_server_name     = "sqlserver873245"
}


module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"

  virtual_network_name = "application-vnet"
  resource_group_name  = "rg-prod"
  location             = "westus2"
  address_space        = ["10.0.0.0/16", ]
}

module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"

  subnet_name          = "Frontend-Subnet"
  virtual_network_name = "application-vnet"
  resource_group_name  = "rg-prod"
  address_prefixes     = ["10.0.0.0/24"]
}

module "backend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"

  subnet_name          = "Backend-Subnet"
  resource_group_name  = "rg-prod"
  virtual_network_name = "application-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "frontend_public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"

  public_ip_name      = "frontend-pip"
  resource_group_name = "rg-prod"
  location            = "westus2"
}

module "backend_public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"

  public_ip_name      = "backend-pip"
  resource_group_name = "rg-prod"
  location            = "westus2"
}

module "frontend_network_interface" {
  depends_on = [module.frontend_subnet, module.frontend_network_security_group]
  source     = "../../modules/azurerm_network_interface"

  nic_name             = "frontend-nic"
  location             = "westus2"
  resource_group_name  = "rg-prod"
  virtual_network_name = "application-vnet"
  subnet_name          = "Frontend-Subnet"
  public_ip_name       = "frontend-pip"
  nsg_name             = "frontend-nsg"
}

module "backend_network_interface" {
  depends_on = [module.backend_subnet, module.backend_network_security_group]
  source     = "../../modules/azurerm_network_interface"

  nic_name             = "backend-nic"
  location             = "westus2"
  resource_group_name  = "rg-prod"
  virtual_network_name = "application-vnet"
  subnet_name          = "Backend-Subnet"
  public_ip_name       = "backend-pip"
  nsg_name             = "backend-nsg"
}

module "frontend_network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"

  nsg_name            = "frontend-nsg"
  location            = "westus2"
  resource_group_name = "rg-prod"
}

module "backend_network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_network_security_group"

  nsg_name            = "backend-nsg"
  location            = "westus2"
  resource_group_name = "rg-prod"
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"

  key_vault_name      = "keyvault3534784"
  resource_group_name = "rg-prod"
  sku_name            = "standard"
  location            = "westus2"
}

module "key_vault_secret_username" {
  depends_on = [module.key_vault]
  source     = "../../modules/azurerm_key_vault_secret"

  resource_group_name    = "rg-prod"
  key_vault_name         = "keyvault3534784"
  key_vault_secret_name  = "vmusername-02"
  key_vault_secret_value = "User-01"
}

module "key_vault_secret_password" {
  depends_on = [module.key_vault]
  source     = "../../modules/azurerm_key_vault_secret"

  resource_group_name    = "rg-prod"
  key_vault_name         = "keyvault3534784"
  key_vault_secret_name  = "vmpassword-02"
  key_vault_secret_value = "Adminuser@123"
}


module "frontend_vm" {
  depends_on = [module.frontend_subnet, module.frontend_network_interface, module.frontend_public_ip, module.key_vault, module.key_vault_secret_username, module.key_vault_secret_password]
  source     = "../../modules/azurerm_linux_virtual_machine"

  virtual_machine_name = "Frontend-VM"
  location             = "westus2"
  resource_group_name  = "rg-prod"
  size                 = "Standard_F2"

  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  publisher     = "Canonical"
  offer         = "0001-com-ubuntu-server-jammy"
  sku           = "22_04-lts"
  image_version = "latest"

  nic_name = "frontend-nic"

  key_vault_name = "keyvault3534784"

  vmusername_secret_name = "vmusername-02"
  vmpassword_secret_name = "vmpassword-02"

}


module "backend_vm" {
  depends_on = [module.backend_subnet, module.backend_network_interface, module.backend_public_ip, module.key_vault, module.key_vault_secret_username, module.key_vault_secret_password]
  source     = "../../modules/azurerm_linux_virtual_machine"

  virtual_machine_name = "Backend-VM"
  location             = "westus2"
  resource_group_name  = "rg-prod"
  size                 = "Standard_F2"

  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  publisher     = "Canonical"
  offer         = "0001-com-ubuntu-server-jammy"
  sku           = "22_04-lts"
  image_version = "latest"

  nic_name = "backend-nic"

  key_vault_name = "keyvault3534784"

  vmusername_secret_name = "vmusername-02"
  vmpassword_secret_name = "vmpassword-02"
}
