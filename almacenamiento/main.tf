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

resource "azurerm_resource_group" "rg" { #rg2 son solo nombres "rg es bloque del grupo de recursos"
  name     = "grupo-almacenamiento"
  location = "brazilsouth"
}

resource "azurerm_storage_account" "storage_account" {
  name                          = "stevekonplatzi123" #entre 3 y 24 caracteres, solo letras minusculas
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}

output "cadena_conexion" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}