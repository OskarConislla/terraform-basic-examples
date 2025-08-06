terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
    azurecaf = {                   # caf = cloud adoption framework, crear versiones unicas de cada uno de los recursos de nombres que tengas
      source  = "aztfmod/azurecaf" # caf = cloud adoption framework, crear versiones unicas de cada uno de los recursos que quieras, para que no tengas que asignarle nombre a cada uno de los recursos que tengas
      version = "1.2.10"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}
