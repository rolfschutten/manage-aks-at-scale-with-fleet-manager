terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.54.0"
    }
    azapi = {
      source = "Azure/azapi"
      version = "~> 1.6.0"
    }
  }
  backend "azurerm" {
        resource_group_name  = ""
        storage_account_name = ""
        container_name       = ""
        key                  = ""
  }
}
provider "azurerm" { 
  features {}
}
provider "azapi" {
}
