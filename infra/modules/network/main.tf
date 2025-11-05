###########################
# Virtual Network
###########################
resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/8"]
  location            = var.location
  resource_group_name = var.aks_resource_group
}

###########################
# Network Security Groups
###########################
# Public Subnet NSG
resource "azurerm_network_security_group" "public_nsg" {
  name                = "${var.vnet_name}-public-nsg"
  location            = var.location
  resource_group_name = var.aks_resource_group

  security_rule {
    name                       = "Allow-HTTP-HTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range           = "*"
    destination_port_ranges     = ["80", "443"]
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}

# Private Subnet NSG
resource "azurerm_network_security_group" "private_nsg" {
  name                = "${var.vnet_name}-private-nsg"
  location            = var.location
  resource_group_name = var.aks_resource_group

  security_rule {
    name                       = "Allow-VNet-Traffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "VirtualNetwork"
  }
}

###########################
# Subnets
###########################
# Public Subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = "${var.vnet_name}-public-subnet"
  resource_group_name  = var.aks_resource_group
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.10.0.0/16"]
}

# Private Subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = "${var.vnet_name}-private-subnet"
  resource_group_name  = var.aks_resource_group
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.20.0.0/16"]
}

###########################
# Associate NSG to Subnets
###########################
resource "azurerm_subnet_network_security_group_association" "public_assoc" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "private_assoc" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}