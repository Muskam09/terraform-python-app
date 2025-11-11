variable "resource_group_name" {
  description = "The name of the resource group to deploy network resources into."
  type        = string
}

variable "location" {
  description = "The Azure region where network resources will be created."
  type        = string
}

variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine (e.g., 'Standard_B1s')."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the VM's network interface."
  type        = string
}

variable "ssh_public_key_content" {
  description = "The content of the SSH public key"
  type        = string
  sensitive   = true
}

variable "install_app_script_url" {
  description = "Link to script"
  type        = string
}

variable "admin_username" {
  description = "Admin username"
  type        = string
}


variable "public_ip_id" {
  description = "The ID of the Public IP Address to associate with the VM's network interface."
  type        = string
}