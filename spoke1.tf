resource "azurerm_virtual_network" "has_demo_vnet_spoke1" {
  name                = "has_demo_vnet_spoke1"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "has_demo_spoke1_subnet_red"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "has_demo_spoke2_subnet_blue"
    address_prefix = "10.0.2.0/24"
    
  }

  tags = {
    environment = "Production"
  }
}