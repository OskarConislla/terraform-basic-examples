provider "azurerm" {
  features {}
  subscription_id = "921a3ca3-8728-4a70-8661-877390957b0e"
}

variable "rg_nombre" {
  type = string
}

locals {
  group_name = "amines${var.rg_nombre}"
}

resource "azurerm_resource_group" "rg" {
  location = "mexicocentral"
  name = local.group_name
}