output "name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}

output "location" {
  description = "Resource group location"
  value       = azurerm_resource_group.main.location
}

output "id" {
  description = "Resource group ID"
  value       = azurerm_resource_group.main.id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}