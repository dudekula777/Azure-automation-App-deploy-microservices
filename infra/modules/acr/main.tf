##########################################
# CONTAINER REGISTRY
##########################################
resource "azurerm_container_registry" "aks_acr" {
  name                = var.aks_acr_name
  resource_group_name = var.aks_resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

##########################################
# LOOKUP AKS CLUSTER (to get managed identity)
##########################################
data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  resource_group_name = var.aks_resource_group
}

##########################################
# ASSIGN ROLE TO AKS MANAGED IDENTITY
##########################################
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.aks_acr.id
  role_definition_name = "AcrPull"
  principal_id         = data.azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}