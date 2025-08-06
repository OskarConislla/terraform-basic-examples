data "azurerm_resource_group" "imported_rg" {
  name = "GrupoPrevio"
} //estoy leyendo las configuraciones de un recurso, no estoy importando el recurso como bloque, a diferencia que en import
//data me permite leer las propiedades, mientras que import me permite importar todo el recurso y manipularlo en mi terraform

resource "azurerm_storage_account" "storage_account" {
  name                     = "almprevio${formatdate("YYYYMMDDhhmm", timestamp())}"
  resource_group_name      = data.azurerm_resource_group.imported_rg.name
  location                 = data.azurerm_resource_group.imported_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}