resource "azurerm_windows_virtual_machine" "win" {
  #count = 1
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    #element(azurerm_network_interface.myvmnic[*].id, count.index)
    azurerm_network_interface.myvmnic.id
  ]

  os_disk {
    #name = "osdisk-${count.index}"
    name = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  provisioner "file" {
   source      = "conf/myapp.conf"
   destination = "C:/App/myapp.conf"

   connection {
    type     = "winrm"
    user     = self.admin_username
    password = self.admin_password
    #host     = self.public_ip_address
    host = "${self.public_ip_address}"
  }
}
}