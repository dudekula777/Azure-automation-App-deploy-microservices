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

  cluster_name       = "aks-${var.environment}-${random_id.suffix.hex}"
  location           = var.location
  resource_group_name = module.resource_group.name
  vnet_subnet_id     = module.network.aks_subnet_id
  
  # Remove or comment out availability_zones
  # availability_zones = ["1", "2", "3"]
  
  # Optional: Use a VM size that supports zones if you need them
  vm_size = "Standard_D2s_v3"
  
  node_count    = 1
  min_count     = 1
  max_count     = 3
  enable_auto_scaling = true

  tags = local.tags
}