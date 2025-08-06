//interfaz de red = tarjeta de red: crea comunicación entre maquina virtual y red que utilizamos. 
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "amines-nic"
  location            = var.vm_location
  resource_group_name = var.vm_resource_group_name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.vm_public_ip_address_id
  }
}

//unimos/asociamos la interfaz de red con el grupo de seguridad
resource "azurerm_network_interface_security_group_association" "nic_association" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = var.vm_network_security_group_id
}

resource "azurerm_windows_virtual_machine" "main" {
  name                  = "amines-vm"
  admin_username        = var.vm_username
  admin_password        = var.vm_password
  location              = var.vm_location
  resource_group_name   = var.vm_resource_group_name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_B2s"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}