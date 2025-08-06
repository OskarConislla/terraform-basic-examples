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
  name     = "azure-functions-test-rg"
  location = "eastus2"
}

module "azurefunctions" {
  source  = "OskarConislla/azurefunctions/azurerm"
  rg_name = azurerm_resource_group.rg.name
  rg_location = azurerm_resource_group.rg.location
  storage_account_name = "functionsapptest234"
  app_service_name = "azure-functions-test-service-plan"
  function_name = "curso-platzi-name"
  storage_account_tier = "Premium"
  storage_replication_type = "LRS"
  app_service_plan_sku_tier = "Basic"
  app_service_plan_sku_size = "B2"
}