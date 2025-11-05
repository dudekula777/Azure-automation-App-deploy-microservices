

# -----------------------------
# NETWORK MODULE
# -----------------------------
module "network" {
  source             = "./modules/network"
  location           = var.location
  aks_resource_group = var.aks_resource_group
}

# -----------------------------
# ACR MODULE
# -----------------------------
module "acr" {
  source              = "./modules/acr"
  location            = var.location
  aks_resource_group  = var.aks_resource_group
  aks_acr_name        = var.aks_acr_name
  cluster_name        = var.cluster_name

  # 👇 This forces Terraform to create AKS first
  depends_on = [module.aks]
}

# -----------------------------
# AKS MODULE
# -----------------------------
module "aks" {
  source            = "./modules/aks"
  location          = var.location
  aks_resource_group = var.aks_resource_group
  cluster_name      = var.cluster_name
  nodepool_name     = var.nodepool_name
  node_count        = var.node_count
  node_vm_size      = var.node_vm_size
  vnet_subnet_id    = module.network.aks_subnet_id
}


