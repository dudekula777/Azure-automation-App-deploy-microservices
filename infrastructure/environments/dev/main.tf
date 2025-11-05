module "resource_group" {
  source = "../../modules/resource-group"

  environment = var.environment
  location    = var.location
}

module "storage" {
  source = "../../modules/storage"

  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

module "acr" {
  source = "../../modules/acr"

  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
}

module "aks" {
  source = "../../modules/aks"

  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  vnet_id             = module.network.vnet_id
  subnet_id           = module.network.aks_subnet_id
  acr_id              = module.acr.id
  kubernetes_version  = var.kubernetes_version
  default_node_count  = var.default_node_count
}