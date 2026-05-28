variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "os_type" { type = string }
variable "ssh_public_key" { type = string }
variable "admin_password" { type = string }
variable "network_interface_id" { type = string }

resource "azurerm_linux_virtual_machine" "linux" {
  count               = var.os_type == "linux" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [var.network_interface_id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "windows" {
  count               = var.os_type == "windows" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [var.network_interface_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

output "id" {
  value = coalesce(try(azurerm_linux_virtual_machine.linux[0].id, null), try(azurerm_windows_virtual_machine.windows[0].id, null))
}
