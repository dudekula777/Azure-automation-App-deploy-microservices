##########################################
# OUTPUTS
##########################################
output "acr_name" {
  value = azurerm_container_registry.aks_acr.name
}

output "acr_login_server" {
  value = azurerm_container_registry.aks_acr.login_server
}

output "acr_admin_username" {
  value     = azurerm_container_registry.aks_acr.admin_username
  sensitive = true
}

output "acr_admin_password" {
  value     = azurerm_container_registry.aks_acr.admin_password
  sensitive = true
}

output "aks_identity_principal_id" {
  value = data.azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}