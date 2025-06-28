terraform {
  required_providers {
    azurerm = {
      version = "4.24.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cebec115-76a4-41a3-b52f-1485335c2232"
}
