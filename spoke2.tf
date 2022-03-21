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

#Create and associate Route Table

resource "azurerm_route_table" "has_demo_rt_spoke2" {
  name                = "has_demo_rt_spoke2"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
}

resource "azurerm_route" "has_demo_route_to_spoke1" {
  name                = "has_demo_route_to_spoke1"
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  route_table_name    = azurerm_route_table.has_demo_rt_spoke2.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = "10.0.0.4"
}

resource "azurerm_subnet_route_table_association" "has_demo_rt_ass_spoke2_green" {
  subnet_id      = azurerm_subnet.has_demo_spoke2_subnet_green.id
  route_table_id = azurerm_route_table.has_demo_rt_spoke2.id
}

resource "azurerm_subnet_route_table_association" "has_demo_rt_ass_spoke2_red" {
  subnet_id      = azurerm_subnet.has_demo_spoke2_subnet_red.id
  route_table_id = azurerm_route_table.has_demo_rt_spoke2.id
}

#VNET Peering

resource "azurerm_virtual_network_peering" "has_demo_peer_hub_spoke2" {
  name                      = "has_demo_peer_hub_spoke2"
  resource_group_name       = azurerm_resource_group.has_demo_rg.name
  virtual_network_name      = azurerm_virtual_network.has_demo_vnet_hub.name
  remote_virtual_network_id = azurerm_virtual_network.has_demo_vnet_spoke2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit = true
}

resource "azurerm_virtual_network_peering" "has_demo_peer_spoke2_hub" {
  name                      = "has_demo_peer_spoke2_hub"
  resource_group_name       = azurerm_resource_group.has_demo_rg.name
  virtual_network_name      = azurerm_virtual_network.has_demo_vnet_spoke2.name
  remote_virtual_network_id = azurerm_virtual_network.has_demo_vnet_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}