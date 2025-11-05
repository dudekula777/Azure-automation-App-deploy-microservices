
variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = "lbs-aks-cluster"
}

variable "nodepool_name" {
  type        = string
  description = "Name of the nodepool"
  default     = "lbgnodepool"
}
variable "location" {
   type        = string
  description = "Azure region for AKS deployment"
  default     = "West Europe"
}

variable "aks_resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "lgb-rgp"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "node_vm_size" {
  type        = string
  description = "Number of nodes in the default node pool"
  default     = "Standard_D1_v2"
}

variable "vnet_subnet_id" {
  type        = string
  description = "Subnet ID for AKS node pool"
  default     = "/subscriptions/your-subscription-id/resourceGroups/lbs-rg/providers/Microsoft.Network/virtualNetworks/lbs-aks-vnet/subnets/lbs-aks-vnet-subnet"
}
