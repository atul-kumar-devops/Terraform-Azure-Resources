resource "azurerm_mssql_server" "child_sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_version
  administrator_login          = data.azurerm_key_vault_secret.sql_server_login.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_server_login_password.value
}
