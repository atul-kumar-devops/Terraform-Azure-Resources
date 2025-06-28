resource "azurerm_linux_virtual_machine" "child_linux_virtual_machine" {
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.size
  network_interface_ids = [data.azurerm_network_interface.data_block_nic.id]

  disable_password_authentication = false
  admin_username                  = data.azurerm_key_vault_secret.data_block_vmusername.value
  admin_password                  = data.azurerm_key_vault_secret.data_block_vmpassword.value

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )
}
