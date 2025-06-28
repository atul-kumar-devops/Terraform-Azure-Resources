variable "sql_server_name" {
  type        = string
  description = "SQL Server Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "mssql_version" {
  type        = string
  description = "SQL Server Version"
}

# variable "administrator_login" {
#   type        = string
#   description = "SQL Server Administator Login"
# }

# variable "administrator_login_password" {
#   type        = string
#   description = "SQL Server Administrator Login Password"
# }

variable "key_vault_name" {
  type        = string
  description = "Key Vault Name"
}

variable "sql_server_username_key" {
  type        = string
  description = "Key Vault Name"
}

variable "sql_server_password_key" {
  type        = string
  description = "Key Vault Name"
}
