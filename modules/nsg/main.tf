variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }

resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "id" { value = azurerm_network_security_group.this.id }
