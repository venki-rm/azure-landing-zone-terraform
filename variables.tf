variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "West Europe"
}

variable "project_prefix" {
  description = "Prefix for resource naming"
  type        = string
  default     = "demo"
}
