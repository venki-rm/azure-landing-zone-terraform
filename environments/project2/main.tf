// Project 2: Highly Available Web App Infrastructure
locals {
  prefix   = "pz-haweb"
  location = var.location
}

module "rg" {
  source   = "../../modules/resource_group"
  name     = "${local.prefix}-rg"
  location = local.location
}

module "vnet" {
  source              = "../../modules/network"
  name                = "${local.prefix}-vnet"
  resource_group_name = module.rg.id
  location            = local.location
  address_space       = ["10.1.0.0/16"]
}

// Add two VMs behind a Load Balancer and Availability Set in a full implementation.
