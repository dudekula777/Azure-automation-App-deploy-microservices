output "cluster_name" {
  description = "AKS cluster name"
  value       = module.aks.cluster_name
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "acr_name" {
  description = "ACR name"
  value       = module.acr.acr_name
}

# Add more outputs as needed
output "cluster_fqdn" {
  description = "AKS cluster FQDN"
  value       = module.aks.cluster_fqdn
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = module.acr.login_server
}