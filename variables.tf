variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group for the main infrastructure deployment."
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the Virtual Network (e.g., '10.0.0.0/16')."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet (e.0.0.0/24')."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the Public IP Address."
  type        = string
  default     = "linuxboxpip"
}

variable "dns_label_prefix" {
  description = "The prefix for the DNS label of the Public IP Address"
  type        = string
  default     = "matetask"
}

#compute
variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_public_key_content" {
  description = "The content of the SSH public key"
  type        = string
  sensitive   = true
}

variable "install_app_script_url" {
  description = "Link to script"
  type        = string
  default     = "https://raw.githubusercontent.com/Muskam09/devops_todolist_terraform_task/refs/heads/main/install-app.sh"
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "testadmin"
}


#storage
variable "storage_account_name" {
  description = "The name of the storage account for application artifacts (must be globally unique)."
  type        = string
  default     = "maskimens09stracc"
}

variable "container_name" {
  description = "The name of the container for application artifacts."
  type        = string
  default     = "task-artifacts"
}

variable "environment_tag" {
  description = "The environment tag for resources."
  type        = string
  default     = "dev"
}