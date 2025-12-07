terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
}


resource "azurerm_resource_group" "rg-sa" {
  name     = "rg-mm-test-42"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "sammtest42"
  resource_group_name      = azurerm_resource_group.rg-sa.name
  location                 = azurerm_resource_group.rg-sa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}