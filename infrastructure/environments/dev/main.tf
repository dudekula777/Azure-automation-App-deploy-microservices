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
#   acr_id              = module.acr.acr_id
#   kubernetes_version  = "1.27.9"  # Use specific supported version
#   default_node_count  = 1

#   # Optional variables with defaults
#   availability_zones = null
#   vm_size           = "Standard_DS2_v2"
# }
module "aks" {
  source = "../../modules/aks"

  resource_group_name = module.resource_group.name
  location            = var.location
  environment         = var.environment
  vnet_id             = module.network.vnet_id
  subnet_id           = module.network.aks_subnet_id
  acr_id              = module.acr.acr_id
  kubernetes_version  = "1.27.9"
  default_node_count  = 1

  # Auto-scaling configuration
  enable_auto_scaling = true
  min_count          = 1
  max_count          = 3

  # Optional variables with defaults
  availability_zones = null
  vm_size           = "Standard_DS2_v2"
}