terraform {
  required_version = ">=1.7.4"
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = ">=3.94.0"
    }
  }
}
provider "azurerm" {
  features { }
  skip_provider_registration = true
}
locals {
    tags = {
        "Environment" = var.Environment
    }
}

resource "azurerm_storage_account" "mimistorageacc" {
  name = var.storage_account_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  public_network_access_enabled = false
  account_replication_type = var.Environment == "Production"? "GRS":"LRS"
  tags = {
    Environment = local.tags
  }
}