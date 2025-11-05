resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}-${random_id.suffix.hex}"
  location = var.location

  tags = {
    Environment = var.environment
    Project     = "healthcare-microservices"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}