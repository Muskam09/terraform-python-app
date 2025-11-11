variable "resource_group_name" {
  description = "The name of the resource group to deploy network resources into."
  type        = string
}

variable "location" {
  description = "The Azure region where network resources will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account for application artifacts (must be globally unique)."
  type        = string

}


variable "container_name" {
  description = "The name of the container for application artifacts."
  type        = string
}
