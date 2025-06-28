variable "virtual_network_name"{
	type = string
	description = "Virtual Network Name"
}

variable "location"{
	type = string
	description = "Virtual Network Location"
}

variable "resource_group_name"{
	type = string
	description = "Resource Group Name"	
}

variable "address_space"{
	type = list(string)
	description = "Address space defined for the Virtual Network"	
}
