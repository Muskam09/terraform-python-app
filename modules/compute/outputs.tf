output "vm_id" {
  description = "The ID of the Virtual Machine."
  value       = azurerm_linux_virtual_machine.matebox.id
}

output "vm_private_ip" {
  description = "The private IP address of the Virtual Machine."
  value       = azurerm_network_interface.main.private_ip_address
}

output "nic_id" {
  description = "The ID of the Network Interface associated with the VM."
  value       = azurerm_network_interface.main.id
}
