#####################################
# OUTPUTS
#####################################
output "cluster_name" {
  description = "AKS Cluster name"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "kube_config" {
  description = "Base64 encoded Kubernetes config"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}

output "identity_principal_id" {
  description = "Principal ID of the AKS managed identity"
  value       = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}
