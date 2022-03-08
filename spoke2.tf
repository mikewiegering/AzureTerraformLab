resource "azurerm_virtual_network" "has_demo_vnet_spoke2" {
  name                = "has_demo_vnet_spoke2"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "has_demo_spoke2_subnet_red"
    address_prefix = "10.1.1.0/24"
  }

  subnet {
    name           = "has_demo_spoke2_subnet_blue"
    address_prefix = "10.1.2.0/24"
    
  }

  tags = {
    environment = "Dev"
  }
}