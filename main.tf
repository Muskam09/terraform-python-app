terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc        = true
  subscription_id = "6919eeb9-de7a-46ba-8188-b68082b9a8f1"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source                      = "./modules/network"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_address_prefix       = var.subnet_address_prefix
  subnet_name                 = var.subnet_name
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label_prefix            = var.dns_label_prefix
}


module "compute" {
  source                 = "./modules/compute"
  resource_group_name    = var.resource_group_name
  location               = var.location
  vm_name                = var.vm_name
  ssh_public_key_content = var.ssh_public_key_content
  vm_size                = var.vm_size
  install_app_script_url = var.install_app_script_url
  subnet_id              = module.network.subnet_id
  public_ip_id           = module.network.public_ip_id
  admin_username         = var.admin_username
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  container_name       = var.container_name
  storage_account_name = var.storage_account_name
}
