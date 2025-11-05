terraform {
  backend "azurerm" {
    resource_group_name  = "lgb-rgp"
    storage_account_name = "lgbtraiacct"
    container_name       = "tfstateaks"
    key                  = "terraform.tfstate"
  }
}