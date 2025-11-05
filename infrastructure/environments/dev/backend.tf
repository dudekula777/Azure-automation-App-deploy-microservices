terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-dev"
    storage_account_name = "tfstatestorage202020"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}