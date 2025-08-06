resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.resource_group_name
}

module "vnet" {
  source                   = "./vnet"
  vnet_location            = azurerm_resource_group.rg.location
  vnet_resource_group_name = azurerm_resource_group.rg.name
}

module "nsg" {
  source                  = "./nsg"
  nsg_location            = azurerm_resource_group.rg.location
  nsg_resource_group_name = azurerm_resource_group.rg.name
}

module "vm" {
  source                       = "./vm"
  vm_location                  = azurerm_resource_group.rg.location
  vm_public_ip_address_id      = module.vnet.vm_public_ip_address_id
  vm_resource_group_name       = azurerm_resource_group.rg.name
  vm_subnet_id                 = module.vnet.vm_subnet_id
  vm_network_security_group_id = module.nsg.vm_network_security_group_id
  vm_username                  = var.vm_username
  vm_password                  = var.vm_password
}