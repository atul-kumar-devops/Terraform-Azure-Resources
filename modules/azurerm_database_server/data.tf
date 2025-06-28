data "azurerm_key_vault" "data_key_vault_database" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "sql_server_login" {
  name         = var.sql_server_username_key
  key_vault_id = data.azurerm_key_vault.data_key_vault_database.id
}

data "azurerm_key_vault_secret" "sql_server_login_password" {
  name         = var.sql_server_password_key
  key_vault_id = data.azurerm_key_vault.data_key_vault_database.id
}
