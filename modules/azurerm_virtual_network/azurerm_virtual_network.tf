resource "azurerm_virtual_network" "child_virtual_network"{
	name = var.virtual_network_name
	location = var.location
	resource_group_name = var.resource_group_name
	address_space = var.address_space
}
