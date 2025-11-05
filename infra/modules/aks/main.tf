
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.aks_resource_group
  dns_prefix          = "${var.cluster_name}-dns"
  kubernetes_version  = "1.32.4"
  private_cluster_enabled = false

  default_node_pool {
    name              = var.nodepool_name
    node_count        = var.node_count
    vm_size           = var.node_vm_size
    os_disk_size_gb   = 128
    vnet_subnet_id    = var.vnet_subnet_id
    max_pods          = 50
    type              = "VirtualMachineScaleSets"
    temporary_name_for_rotation = "tempnp"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin       = "azure"
    network_plugin_mode  = "overlay"
    network_policy       = "calico"
    load_balancer_sku    = "standard"
  }

  tags = {
    Environment = "dev"
    Owner       = "devops-team"
  }
}

resource "azurerm_public_ip" "aks_ip" {
  name                = "aks-public-ip"
  location            = var.location
  resource_group_name = var.aks_resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "public_ip" {
  value = azurerm_public_ip.aks_ip.ip_address
}

