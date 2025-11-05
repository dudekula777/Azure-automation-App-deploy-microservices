resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${var.environment}-${random_id.suffix.hex}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.environment}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name           = "default"
    node_count     = var.default_node_count
    vm_size        = "Standard_B2s"
    vnet_subnet_id = var.subnet_id
    zones          = ["1", "2", "3"]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  role_based_access_control_enabled = true

  tags = {
    Environment = var.environment
  }
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