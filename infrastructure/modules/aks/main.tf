resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    vnet_subnet_id      = var.vnet_subnet_id
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.min_count
    max_count           = var.max_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
  dns_service_ip     = "10.1.0.10"
  service_cidr       = "10.1.0.0/16"
  docker_bridge_cidr = "172.17.0.1/16"
  network_plugin     = "azure"
  load_balancer_sku  = "standard"
  outbound_type      = "loadBalancer"
  }

  tags = var.tags
}

# TEMPORARILY COMMENT OUT - Remove circular dependency
resource "azurerm_role_assignment" "aks_acr" {

  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true

   depends_on = [azurerm_kubernetes_cluster.main]
 }