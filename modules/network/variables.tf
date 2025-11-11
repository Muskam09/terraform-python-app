variable "resource_group_name" {
  description = "The name of the resource group to deploy network resources into."
  type        = string
}

variable "location" {
  description = "The Azure region where network resources will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the Virtual Network (e.g., '10.0.0.0/16')."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet (e.0.0.0/24')."
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
}

variable "public_ip_address_name" {
  description = "The name of the Public IP Address."
  type        = string
}

variable "dns_label_prefix" {
  description = "The prefix for the DNS label of the Public IP Address (e.g., 'matetask')."
  type        = string
}