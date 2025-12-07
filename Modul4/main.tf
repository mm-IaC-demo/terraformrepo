terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  # Configuration options

  features {

  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name     = var.saname
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS" 
}
module "network" {
  source     = "./modules/network"
  rgname     = azurerm_resource_group.rg.name
  location   = var.location
  vnetname   = var.vnetname
  nsgname    = var.nsgname
  subnetname = var.subnetname

}
module "vm" {
  source   = "./modules/vm"
  rgname   = azurerm_resource_group.rg.name 
  location = var.location
  vmname = var.vmname
  vm_size = var.vm_size
  subnet_id = module.network.subnet_id

}
/*
module "database" {
  source      = "./modules/database"
  rgname      = azurerm_resource_group.rg.name
  location    = var.location
  saname      = var.saname
  mssqlname   = var.mssqlname
  mssqldbname = var.mssqldbname

}
*/