output "vnet_id" {
  description = "ID Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "ID Subnet."
  value       = azurerm_subnet.default.id
}

output "nsg_id" {
  description = "ID Network Security Group."
  value       = azurerm_network_security_group.defaultnsg.id
}
output "public_ip_id" {
  description = "The ID of the Public IP Address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  description = "Actual public IP address."
  value       = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_fqdn" {
  description = "Fully qualified domain name (FQDN) of the public IP address."
  value       = azurerm_public_ip.linuxboxpip.fqdn
}

output "public_ip_dns_label" {
  description = "Generated DNS label for public IP address."
  value       = azurerm_public_ip.linuxboxpip.domain_name_label
}
