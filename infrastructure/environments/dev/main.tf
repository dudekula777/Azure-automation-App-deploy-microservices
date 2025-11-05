resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  tags = {
    Environment = var.environment
    Project     = "YourProjectName"
    Terraform   = "true"
  }
}

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
  cluster_name        = "aks-${var.environment}-${random_id.suffix.hex}"
  dns_prefix          = "aks-${var.environment}"
  vnet_subnet_id      = module.network.aks_subnet_id
  environment         = var.environment
  kubernetes_version  = "1.27.9"
  acr_id              = module.acr.acr_id  # This passes the ACR ID to the AKS module
  
  # Node configuration
  node_count          = 1
  vm_size             = "Standard_DS2_v2"
  
  # Network configuration
  service_cidr        = "10.0.0.0/16"
  dns_service_ip      = "10.0.0.10"
  
  # Auto-scaling
  enable_auto_scaling = true
  min_count          = 1
  max_count          = 3
  
  tags = local.tags
}