//red virtuak
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = "amines-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
}

//subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "amines-subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

//ip publica
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = "amines-public-ip"
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
  allocation_method   = "Static"
}