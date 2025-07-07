resource "azurerm_virtual_network" "n01729752-VNET" {
  name                = var.vnet
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_space
  tags = var.tags
}

resource "azurerm_subnet" "n01729752-SUBNET" {
  name                 = var.subnet
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.n01729752-VNET.name
  address_prefixes     = var.subnet_space
}


resource "azurerm_network_security_group" "sg" {
  name                = var.security_group1.sg_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags = var.tags

  security_rule {
    name                       = var.security_group1.rule1_name
    priority                   = var.security_group1.rule1_priority
    direction                  = var.security_group1.direction
    access                     = var.security_group1.access
    protocol                   = var.security_group1.protocol
    source_port_range          = "*"
    destination_port_range     = var.security_group1.rule1_dst
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = var.security_group1.rule2_name
    priority                   = var.security_group1.rule2_priority
    direction                  = var.security_group1.direction
    access                     = var.security_group1.access
    protocol                   = var.security_group1.protocol
    source_port_range          = "*"
    destination_port_range     = var.security_group1.rule2_dst
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = var.security_group1.rule3_name
    priority                   = var.security_group1.rule3_priority
    direction                  = var.security_group1.direction
    access                     = var.security_group1.access
    protocol                   = var.security_group1.protocol
    source_port_range          = "*"
    destination_port_range     = var.security_group1.rule3_dst
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = var.security_group1.rule4_name
    priority                   = var.security_group1.rule4_priority
    direction                  = var.security_group1.direction
    access                     = var.security_group1.access
    protocol                   = var.security_group1.protocol
    source_port_range          = "*"
    destination_port_range     = var.security_group1.rule4_dst
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sga" {
  subnet_id                 = azurerm_subnet.n01729752-SUBNET.id
  network_security_group_id = azurerm_network_security_group.sg.id
}
