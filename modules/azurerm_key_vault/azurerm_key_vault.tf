resource "azurerm_key_vault" "child_key_vault"{
	name = var.key_vault_name
	location = var.location
	resource_group_name = var.resource_group_name
	sku_name = var.sku_name
	tenant_id = data.azurerm_client_config.current.tenant_id

	access_policy {
		tenant_id = data.azurerm_client_config.current.tenant_id
		object_id =  data.azurerm_client_config.current.object_id
	

		key_permissions= [
		"Get",
		]

		secret_permissions =[

		"Get", "Set", "List"
		]

		storage_permissions = [
		"Get",
		]
	}
}

