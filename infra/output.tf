# -----------------------------
# OUTPUTS
# -----------------------------
output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "acr_name" {
  value = module.acr.acr_name
}

output "vnet_subnet_id" {
  description = "Subnet ID output from network module"
  value       = module.network.aks_subnet_id
}
