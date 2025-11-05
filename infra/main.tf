provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  location            = var.location
  aks_resource_group  = var.aks_resource_group
}

module "acr" {
  source              = "./modules/acr"
  client_id           = var.client_id
  aks_acr             = var.aks_acr
  aks_resource_group  = var.aks_resource_group
  location            = var.location
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.cluster_name
  location            = var.location
  aks_resource_group  = var.aks_resource_group
  node_count          = var.node_count
  node_vm_size        = var.node_vm_size
  vnet_subnet_id      = module.network.aks_subnet_id
}