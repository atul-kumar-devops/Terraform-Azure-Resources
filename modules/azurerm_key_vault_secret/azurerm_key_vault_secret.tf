resource "azurerm_key_vault_secret" "child_key_vault_secret"{
	name = var.key_vault_secret_name
	value = var.key_vault_secret_value
	key_vault_id = data.azurerm_key_vault.data_block_key_vault.id
}
