provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}

import {
  to = azurerm_storage_account.mi_cuenta
  id = "/subscriptions/921a3ca3-8728-4a70-8661-877390957b0e/resourceGroups/logsGroup/providers/Microsoft.Storage/storageAccounts/logstorageaccount234"
}//data me permite leer las propiedades, mientras que import me permite importar todo el recurso y manipularlo en mi terraform
//data puedo traerme la info pero no lo puedo manipular, cuando uso import incluso puedo eliminarlo de mi nube
//data no elimina recursos de terceros, es más seguro si solo quieres checar

resource "azurerm_storage_account" "mi_cuenta" {
  name                          = "logstorageaccount234" #entre 3 y 24 caracteres, solo letras minusculas
  resource_group_name           = "logsGroup"
  location                      = "brazilsouth"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
}