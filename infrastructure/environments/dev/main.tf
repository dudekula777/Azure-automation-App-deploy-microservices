# Random ID for unique resource names
resource "random_id" "suffix" {
  byte_length = 4
}

# Local values for tags
locals {
  tags = {
    Environment = var.environment
    Project     = "YourProjectName"
    Terraform   = "true"
  }
}

# Resource Group Module
module "resource_group" {
  source = "../../modules/resource-group"

  environment = var.environment
  location    = var.location
}

# Storage Module
module "storage" {
  source = "../../modules/storage"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
}

# Network Module
module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
}

# ACR Module
module "acr" {
  source = "../../modules/acr"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
}

# AKS Module
module "aks" {
  source = "../../modules/aks"

  # Basic configuration
  cluster_name          = "aks-${var.environment}-${random_id.suffix.hex}"
  resource_group_name   = module.resource_group.resource_group_name
  location              = var.location
  dns_prefix            = "aks-${var.environment}"
  kubernetes_version    = "1.33.3"
  
  # Network configuration
  vnet_subnet_id        = module.network.aks_subnet_id
  
  # ACR integration
  acr_id                = module.acr.acr_id
  
  tags = local.tags
}