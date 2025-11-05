# resource "azurerm_kubernetes_cluster" "main" {
#   name                = var.cluster_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   dns_prefix          = var.dns_prefix
#   kubernetes_version  = var.kubernetes_version

#   default_node_pool {
#     name                = "default"
#     node_count          = var.node_count
#     vm_size             = var.vm_size
    
#     # Handle null/empty availability_zones
#     availability_zones  = var.availability_zones != null && length(var.availability_zones) > 0 ? var.availability_zones : null
    
#     enable_auto_scaling = var.enable_auto_scaling
#     min_count           = var.min_count
#     max_count           = var.max_count
#     vnet_subnet_id      = var.vnet_subnet_id
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   network_profile {
#     network_plugin = "azure"
#     service_cidr   = var.service_cidr
#     dns_service_ip = var.dns_service_ip
#   }

#   tags = var.tags
# }
resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    vnet_subnet_id  = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  tags = var.tags
}

# Separate node pool with availability zones (if needed)
resource "azurerm_kubernetes_cluster_node_pool" "main" {
  name                  = "main"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  vm_size               = var.vm_size
  node_count            = var.node_count
  availability_zones    = var.availability_zones
  enable_auto_scaling   = var.enable_auto_scaling
  min_count            = var.min_count
  max_count            = var.max_count
  vnet_subnet_id       = var.vnet_subnet_id
}
resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

resource "random_id" "suffix" {
  byte_length = 4
}