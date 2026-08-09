terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "689d8795-0870-408a-b842-d792486c2dba"

}