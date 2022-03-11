resource "azurerm_virtual_network" "has_demo_vnet_spoke2" {
  name                = "has_demo_vnet_spoke2"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.2.0.4", "10.2.0.5"]

 

  tags = {
    environment = "Dev"
  }

}
resource "azurerm_subnet" "has_demo_spoke2_subnet_red" {
  name                 = "has_demo_spoke2_subnet_red"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_spoke2.name
  address_prefixes     = ["10.2.1.0/24"]
}

resource "azurerm_subnet" "has_demo_spoke2_subnet_green" {
  name                 = "has_demo_spoke2_subnet_green"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_spoke2.name
  address_prefixes     = ["10.2.2.0/24"]

}