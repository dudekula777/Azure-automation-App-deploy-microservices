
resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/8"]
  location            = var.location
  resource_group_name = var.aks_resource_group
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.aks_resource_group
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.240.0.0/16"]
}
