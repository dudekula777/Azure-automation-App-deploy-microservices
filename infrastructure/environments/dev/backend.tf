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
    resource_group_name  = "tfstate-rg-dev"
    storage_account_name = "tfstatestorage202020"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}  # Only one features block!
  use_cli = false
  
}

provider "random" {
  # No configuration needed
}