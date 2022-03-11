resource "azurerm_virtual_network" "has_demo_vnet_spoke1" {
  name                = "has_demo_vnet_spoke1"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]


  

  tags = {
    environment = "demo"
  }

}

# Create Subnets

resource "azurerm_subnet" "has_demo_spoke1_subnet_red" {
  name                 = "has_demo_spoke1_subnet_red"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_spoke1.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "has_demo_spoke1_subnet_green" {
  name                 = "has_demo_spoke1_subnet_green"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_spoke1.name
  address_prefixes     = ["10.1.2.0/24"]

}
