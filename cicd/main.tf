provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}

resource "azurerm_resource_group" "rg" { #rg2 son solo nombres
  name     = "cicd-group-oska"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage" {
  name = "continousdeployosk"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_amin" {
  name = "platziperu"
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type = "container"
}

resource "azurerm_storage_container" "container_oskar" {
  name = "oskarconislla"
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type = "container"
}
