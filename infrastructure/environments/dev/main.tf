module "aks" {
  source = "../../modules/aks"

  # Basic configuration
  cluster_name          = "aks-${var.environment}-${random_id.suffix.hex}"
  resource_group_name   = module.resource_group.resource_group_name  # Fixed output name
  location              = var.location
  dns_prefix            = "aks-${var.environment}"
  kubernetes_version    = "1.33.3"
  
  # Network configuration
  vnet_subnet_id        = module.network.aks_subnet_id  # Make sure this output exists
  
  # ACR integration
  acr_id                = module.acr.acr_id  # Make sure this output exists
  
  # Node configuration - use direct values instead of variables for now
  # Remove these if your AKS module doesn't use them:
  # node_count          = 1
  # vm_size             = "Standard_EC2as_v5"
  # enable_auto_scaling = true
  # min_count          = 1
  # max_count          = 3
  
  # Remove these as they're configured in the module's network_profile:
  # service_cidr        = "10.1.0.0/16"  # Use non-overlapping range
  # dns_service_ip      = "10.1.0.10"
  
  tags = local.tags

  depends_on = [
    module.resource_group,
    module.network,
    module.acr
  ]
}