resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${var.environment}-${random_id.suffix.hex}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.environment}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                 = "default"
    vm_size              = "Standard_EC2as_v5"  # Only one definition
    enable_auto_scaling  = false                # Only one definition
    node_count           = 1
    min_count            = 1
    max_count            = 3
    vnet_subnet_id      = var.vnet_subnet_id
    type                = "VirtualMachineScaleSets"
    os_disk_type        = "Managed"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    service_cidr       = "10.1.0.0/16"
    dns_service_ip     = "10.1.0.10"
    outbound_type      = "loadBalancer"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Terraform   = "true"
  }
}

# TEMPORARILY COMMENT OUT - Remove circular dependency
resource "azurerm_role_assignment" "aks_acr" {

  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true

   depends_on = [azurerm_kubernetes_cluster.main]
 }