terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-dev-3b224b32"  # Use your main resource group
    storage_account_name = "tfstatedev6585c5a7"  # Use your storage account name
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_cli = false  # Important: prevents Azure CLI fallback
}

provider "random" {
  # No configuration needed
}