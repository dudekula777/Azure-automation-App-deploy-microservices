output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.tfstate.name
}

output "storage_account_id" {
  description = "Storage account ID"
  value       = azurerm_storage_account.tfstate.id
}

output "container_name" {
  description = "Storage container name"
  value       = azurerm_storage_container.tfstate.name
}

output "primary_access_key" {
  description = "Primary access key"
  value       = azurerm_storage_account.tfstate.primary_access_key
  sensitive   = true
}