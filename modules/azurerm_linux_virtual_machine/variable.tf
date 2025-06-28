variable "virtual_machine_name" {
  type        = string
  description = "Virtual Machine Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Virtual Machine Location"
}

variable "size" {
  type        = string
  description = "VM Size"
}

variable "caching" {
  type        = string
  description = "OS Disk Cachin"
}

variable "storage_account_type" {
  type        = string
  description = "OS Disk Storage Account Type"
}

variable "publisher" {
  type        = string
  description = "VM Publisher"
}

variable "offer" {
  type        = string
  description = "VM Offer"
}

variable "sku" {
  type        = string
  description = "VM SKU"
}

variable "image_version" {
  type        = string
  description = "VM version"
}


variable "nic_name" {
  type        = string
  description = "nic_name"
}

variable "key_vault_name" {
  type        = string
  description = "Key Vault Name"
}

variable "vmusername_secret_name" {
  type        = string
  description = "Username from Key Vault"
}

variable "vmpassword_secret_name" {
  type        = string
  description = "Password from Key Vault"
}
