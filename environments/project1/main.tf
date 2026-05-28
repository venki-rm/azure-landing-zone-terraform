# Project 1: Minimal Azure Landing Zone
# Deploys: Resource Group, VNet, Subnet, Storage Account

terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

locals {
  location = var.location
}

# Resource Group
module "rg" {
  source   = "../../modules/resource_group"
  name     = var.resource_group_name
  location = local.location
}

# Virtual Network
module "vnet" {
  source              = "../../modules/network"
  name                = var.vnet_name
  resource_group_name = module.rg.id
  location            = local.location
  address_space       = var.vnet_address_space
}

# Subnet
module "subnet" {
  source               = "../../modules/subnet"
  name                 = var.subnet_name
  resource_group_name  = module.rg.id
  virtual_network_name = module.vnet.name
  address_prefix       = var.subnet_address_prefix
}

# Storage Account (name must be lowercase, globally unique)
module "storage" {
  source              = "../../modules/storage"
  name                = var.storage_account_name
  resource_group_name = module.rg.id
  location            = local.location
}
