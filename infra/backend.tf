terraform {
  backend "azurerm" {
    resource_group_name  = ""  # Will be passed via -backend-config
    storage_account_name = ""  # Will be passed via -backend-config
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
