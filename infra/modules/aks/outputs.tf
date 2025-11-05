output "resource_group_name" {
  value = var.aks_resource_group
}

output "load_balancer_url" {
  value = "http://${azurerm_public_ip.aks_ip.ip_address}"
}

