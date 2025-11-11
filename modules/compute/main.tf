resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_linux_virtual_machine" "matebox" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  size                  = var.vm_size

  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key_content
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    name                 = "myosdisk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_extension" "custom_script_extension" {
  name                 = "install-app-custom-script"
  virtual_machine_id   = azurerm_linux_virtual_machine.matebox.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "fileUris": ["${var.install_app_script_url}"],
  "commandToExecute": "bash install-app.sh"
 }
SETTINGS
}
