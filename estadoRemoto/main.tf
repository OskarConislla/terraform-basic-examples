resource "azurecaf_name" "rg_name" {       #caf_name va a asignar un nombre a mi grupo de recursos
  name          = "amines"                 #incluido en todos mis recursos
  resource_type = "azurerm_resource_group" #resource group
  prefixes      = ["dev"]
  suffixes      = ["y", "z"] #crear cosas aleatorias
  random_length = 3
  clean_input   = true
}

resource "azurerm_resource_group" "rg" { #rg2 son solo nombres
  name     = azurecaf_name.rg_name.result
  location = "brazilsouth"
}

resource "azurecaf_name" "storage_name" {
  name          = "amines"
  resource_type = "azurerm_storage_account"
  prefixes      = ["dev"]
  random_length = 3
  clean_input   = true
}

resource "azurerm_storage_account" "storage_account" {
  name                          = azurecaf_name.storage_name.result #entre 3 y 24 caracteres, solo letras minusculas
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}

