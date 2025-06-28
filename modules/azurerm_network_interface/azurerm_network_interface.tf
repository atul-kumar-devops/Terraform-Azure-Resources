resource "azurerm_network_interface" "nic_child" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.data_block_subnet.id
    public_ip_address_id          = data.azurerm_public_ip.data_block_pip.id
  }

}

resource "azurerm_network_interface_security_group_association" "nsg_assocation_child" {
  network_interface_id      = azurerm_network_interface.nic_child.id
  network_security_group_id = data.azurerm_network_security_group.data_block_nsg.id
}
