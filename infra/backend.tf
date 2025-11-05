terraform {
  backend "azurerm" {
    resource_group_name  = var.aks_resource_group
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
