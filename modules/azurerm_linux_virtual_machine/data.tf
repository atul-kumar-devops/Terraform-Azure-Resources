data "azurerm_network_interface" "data_block_nic"{
	name = var.nic_name
	resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "data_block_key_vault"{
	name = var.key_vault_name
	resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "data_block_vmusername"{
	name = var.vmusername_secret_name
	key_vault_id = data.azurerm_key_vault.data_block_key_vault.id
}

data "azurerm_key_vault_secret" "data_block_vmpassword"{
	name = var.vmpassword_secret_name
	key_vault_id = data.azurerm_key_vault.data_block_key_vault.id
}