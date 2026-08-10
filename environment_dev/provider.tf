terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "abhitfstate2026"
    container_name       = "tfstate"
    key                  = "environment-dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "689d8795-0870-408a-b842-d792486c2dba"

}