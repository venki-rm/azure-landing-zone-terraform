variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "project_prefix" {
  description = "Prefix for resource naming (for future use)"
  type        = string
  default     = "proj1"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-proj1-dev"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet-proj1-dev"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-management"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "storage_account_name" {
  description = "Name for storage account (must be 3-24 lowercase alphanumeric characters, globally unique)"
  type        = string
  default     = "stproj1dev001"
}
