variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }

resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}

output "principal_id" { value = azurerm_user_assigned_identity.this.principal_id }
output "client_id" { value = azurerm_user_assigned_identity.this.client_id }
