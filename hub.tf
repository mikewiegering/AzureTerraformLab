resource "azurerm_virtual_network" "has_demo_vnet_hub" {
  name                = "has_demo_vnet_hub"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  tags = {
    environment = "demo"
  }

}

# Create Subnets

resource "azurerm_subnet" "has_demo_hub_subnet_dmz" {
  name                 = "has_demo_hub_subnet_red"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_hub.name
  address_prefixes     = ["10.0.1.0/24"]
}


# Create Azure Firewall Service


# resource "azurerm_subnet" "has_demo_hub_subnet_afw" {
#   name                 = "AzureFirewallSubnet"
#   resource_group_name  = azurerm_resource_group.has_demo_rg.name
#   virtual_network_name = azurerm_virtual_network.has_demo_vnet_hub.name
#   address_prefixes     = ["10.0.0.0/24"]

# }

# resource "azurerm_public_ip" "has_demo_afw_puip" {
#   name                = "has_demo_afw_puip"
#   location            = azurerm_resource_group.has_demo_rg.location
#   resource_group_name = azurerm_resource_group.has_demo_rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# resource "azurerm_firewall" "has_demo_afw" {
#   name                = "has_demo_afw"
#   location            = azurerm_resource_group.has_demo_rg.location
#   resource_group_name = azurerm_resource_group.has_demo_rg.name

#   ip_configuration {
#     name                 = "has_demo_afw_ipconfig"
#     subnet_id            = azurerm_subnet.has_demo_hub_subnet_afw.id
#     public_ip_address_id = azurerm_public_ip.has_demo_afw_puip.id
#   }
# }


# resource "azurerm_firewall_network_rule_collection" "has_demo_afw_rule_collection_east_west" {
#   name                = "has_demo_afw_rule_collection_east_west"
#   azure_firewall_name = azurerm_firewall.has_demo_afw.name
#   resource_group_name = azurerm_resource_group.has_demo_rg.name
#   priority            = 100
#   action              = "Allow"

  
#     rule {
#     name = "red to green"

#     source_addresses = [
#       "10.1.0.0/16", "10.2.0.0/16"
#     ]

#     destination_ports = [
#       "*",
#     ]

#     destination_addresses = [
#       "10.1.0.0/16", "10.2.0.0/16"
#     ]

#     protocols = [
#       "ICMP",
#     ]
#   }
  
#   rule {
#     name = "red to red"

#     source_addresses = [
#       "10.1.1.0/24", "10.2.1.0/24"
#     ]

#     destination_ports = [
#       "*",
#     ]

#     destination_addresses = [
#       "10.1.1.0/24", "10.2.1.0/24"
#     ]

#     protocols = [
#       "Any",
#     ]
#   }
#   rule {
#     name = "green to green"

#     source_addresses = [
#       "10.1.2.0/24", "10.2.2.0/24"
#     ]

#     destination_ports = [
#       "*",
#     ]

#     destination_addresses = [
#       "10.1.2.0/24", "10.2.2.0/24"
#     ]

#     protocols = [
#       "Any",
#     ]
#   }

# }



#Create Azure Bastion Service


resource "azurerm_subnet" "has_demo_hub_subnet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.has_demo_rg.name
  virtual_network_name = azurerm_virtual_network.has_demo_vnet_hub.name
  address_prefixes     = ["10.0.12.0/26"]

}

resource "azurerm_public_ip" "has_demo_bastion_puip" {
  name                = "has_demo_bastion_puip"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "has_demo_bastion" {
  name                = "has_demo_bastion"
  location            = azurerm_resource_group.has_demo_rg.location
  resource_group_name = azurerm_resource_group.has_demo_rg.name

  ip_configuration {
    name                 = "has_demo_bastion_ipconfig"
    subnet_id            = azurerm_subnet.has_demo_hub_subnet_bastion.id
    public_ip_address_id = azurerm_public_ip.has_demo_bastion_puip.id
  }
}