terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}

resource "azurerm_resource_group" "rg" { #rg2 son solo nombres
  name     = var.rg_nombre
  location = "mexicocentral"
}