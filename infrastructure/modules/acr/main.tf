resource "azurerm_container_registry" "main" {
  name                = "acr${var.environment}${random_id.suffix.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    Environment = var.environment
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}