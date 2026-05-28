// Project 3: Hybrid Enterprise Infrastructure (simulation)
locals {
  prefix   = "pz-hybrid"
  location = var.location
}

module "rg" {
  source   = "../../modules/resource_group"
  name     = "${local.prefix}-rg"
  location = local.location
}

// In a fuller implementation add VPN gateway, local network gateway, and connection resources.
