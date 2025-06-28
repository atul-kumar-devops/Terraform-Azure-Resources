data "azurerm_subnet" "data_block_subnet" {
	name = var.subnet_name
	virtual_network_name = var.virtual_network_name
	resource_group_name = var.resource_group_name
}

data "azurerm_public_ip" "data_block_pip" {
	name = var.public_ip_name
	resource_group_name = var.resource_group_name
}

data "azurerm_network_security_group" "data_block_nsg"{
    name = var.nsg_name
    resource_group_name = var.resource_group_name
}