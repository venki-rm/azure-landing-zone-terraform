variable "scope" { type = string }
variable "role_definition_name" { type = string }
variable "principal_id" { type = string }

data "azurerm_role_definition" "role" {
  name = var.role_definition_name
}

resource "azurerm_role_assignment" "this" {
  scope                = var.scope
  role_definition_id   = data.azurerm_role_definition.role.id
  principal_id         = var.principal_id
}

output "id" { value = azurerm_role_assignment.this.id }
