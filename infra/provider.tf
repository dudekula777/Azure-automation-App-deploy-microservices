provider "azurerm" {
  features = {}

  tenant_id       = var.tenant_id       # from variables.tf
  subscription_id = var.subscription_id # from variables.tf
  client_id       = var.client_id       # from variables.tf
  client_secret   = var.client_secret   # from variables.tf
}
