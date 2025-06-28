data "azurerm_key_vault" "data_block_key_vault"{
	name = var.key_vault_name
	resource_group_name = var.resource_group_name
}
