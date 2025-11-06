# Basic outputs that should work with most AKS modules
output "cluster_name" {
  description = "AKS cluster name"
  value       = try(module.aks.cluster_name, null)
}

output "resource_group_name" {
  description = "Resource group name"
  value       = try(module.resource_group.name, module.resource_group.resource_group_name, null)
}

output "acr_name" {
  description = "ACR name"
  value       = try(module.acr.name, module.acr.acr_name, null)
}

# Common AKS outputs - adjust based on your actual module
output "cluster_id" {
  description = "AKS cluster ID"
  value       = try(module.aks.cluster_id, null)
}

output "kube_config" {
  description = "Kubernetes config"
  value       = try(module.aks.kube_config, null)
  sensitive   = true
}

output "host" {
  description = "Kubernetes cluster host"
  value       = try(module.aks.host, null)
  sensitive   = true
}

# Common ACR outputs
output "acr_login_server" {
  description = "ACR login server URL"
  value       = try(module.acr.login_server, null)
}

# Network outputs (if needed)
output "vnet_name" {
  description = "Virtual Network name"
  value       = try(module.network.vnet_name, null)
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = try(module.network.vnet_id, null)
}