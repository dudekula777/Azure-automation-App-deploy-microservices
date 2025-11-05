terraform {
  backend "azurerm" {
    resource_group_name  = "" # set via CLI in GitHub Actions
    storage_account_name = "" # set via CLI in GitHub Actions
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
