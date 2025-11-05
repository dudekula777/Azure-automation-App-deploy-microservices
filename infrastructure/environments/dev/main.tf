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

# module "aks" {
#   source = "../../modules/aks"

#   resource_group_name = module.resource_group.name
#   location            = var.location
#   environment         = var.environment
#   vnet_id             = module.network.vnet_id
#   subnet_id           = module.network.aks_subnet_id
#   acr_id              = module.acr.id
#   kubernetes_version  = var.kubernetes_version
#   default_node_count  = var.default_node_count
# }

module "aks" {
  source = "../../modules/aks"

  cluster_name       = "aks-${var.environment}-${random_id.suffix.hex}"
  location           = var.location
  resource_group_name = module.resource_group.name
  vnet_subnet_id     = module.network.aks_subnet_id
  
  # Option A: Don't set it (will use default null)
  # Option B: Explicitly set to null
  availability_zones = null
  
  node_count    = 1
  min_count     = 1
  max_count     = 3
  enable_auto_scaling = true
  vm_size       = "Standard_DS2_v2"

  tags = local.tags
}