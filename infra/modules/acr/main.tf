
data "azuread_service_principal" "sp" {
  client_id = var.client_id
}

resource "azurerm_container_registry" "aks_acr" {
  name                = var.aks_acr
  resource_group_name = var.aks_resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr_access" {
  scope                = azurerm_container_registry.aks_acr.id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_service_principal.sp.object_id
}
