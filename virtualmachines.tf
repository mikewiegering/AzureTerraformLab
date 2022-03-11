
resource "azurerm_network_interface" "has_demo_spoke1_nic_red" {
  name                = "has_demo_spoke1_nic_red"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.has_demo_spoke1_subnet_red.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "has_demo_spoke1_vm_red" {
  name                = "has.demo.spoke1.vm.red"
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  location            = azurerm_resource_group.has_demo_rg.location
  size                = "Standard_F2"
  admin_username      = "demouser"
  admin_password      = "WWTwwtWWTwwt1!"
  disable_password_authentication  = false
  network_interface_ids = [
    azurerm_network_interface.has_demo_spoke1_nic_red.id,
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "has_demo_spoke1_nic_green" {
  name                = "has_demo_spoke1_nic_green"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.has_demo_spoke1_subnet_green.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "has_demo_spoke1_vm_green" {
  name                = "has.demo.spoke1.vm.green"
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  location            = azurerm_resource_group.has_demo_rg.location
  size                = "Standard_F2"
  admin_username      = "demouser"
  admin_password      = "WWTwwtWWTwwt1!"
  disable_password_authentication  = false
  network_interface_ids = [
    azurerm_network_interface.has_demo_spoke1_nic_green.id,
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "has_demo_spoke2_nic_red" {
  name                = "has_demo_spoke2_nic_red"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.has_demo_spoke2_subnet_red.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "has_demo_spoke2_vm_red" {
  name                = "has.demo.spoke2.vm.red"
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  location            = azurerm_resource_group.has_demo_rg.location
  size                = "Standard_F2"
  admin_username      = "demouser"
  admin_password      = "WWTwwtWWTwwt1!"
  disable_password_authentication  = false
  network_interface_ids = [
    azurerm_network_interface.has_demo_spoke2_nic_red.id,
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "has_demo_spoke2_nic_green" {
  name                = "has_demo_spoke2_nic_green"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.has_demo_spoke2_subnet_green.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "has_demo_spoke2_vm_green" {
  name                = "has.demo.spoke2.vm.green"
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  location            = azurerm_resource_group.has_demo_rg.location
  size                = "Standard_F2"
  admin_username      = "demouser"
  admin_password      = "WWTwwtWWTwwt1!"
  disable_password_authentication  = false
  network_interface_ids = [
    azurerm_network_interface.has_demo_spoke2_nic_green.id,
  ]

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
