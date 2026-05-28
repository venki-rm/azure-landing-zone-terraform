output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.rg.id
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.vnet.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.vnet.name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.subnet.id
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.storage.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = lower(var.storage_account_name)
}
