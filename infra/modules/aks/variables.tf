#####################################
# VARIABLES
#####################################
variable "location" {
  type        = string
  description = "Azure region for AKS deployment"
}

variable "aks_resource_group" {
  type        = string
  description = "Resource group for AKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name"
}

variable "nodepool_name" {
  type        = string
  description = "Node pool name"
  default     = "lbgnodepool"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in node pool"
  default     = 2
}

variable "node_vm_size" {
  type        = string
  description = "VM size for AKS nodes"
  default     = "Standard_D2s_v3"
}

variable "vnet_subnet_id" {
  type        = string
  description = "The subnet ID where AKS nodes will be deployed"
}