provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}

resource "azurerm_resource_group" "rg" { #rg2 son solo nombres
  name     = "cicd-group"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage" {
  name = "continousdeployment"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name = "aminespinoza"
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type = "container"
}