variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vnet_subnet_id" {
  description = "VNet subnet ID for AKS"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 1
}
variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_EC2as_v5"
}
variable "enable_auto_scaling" {
  description = "Enable auto-scaling"
  type        = bool
  default     = false
}
variable "acr_id" {
  description = "ACR ID for role assignment"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
variable "min_count" {
  description = "Minimum node count for auto-scaling"
  type        = number
  default     = null  # Set to null when auto-scaling is disabled
}

variable "max_count" {
  description = "Maximum node count for auto-scaling"
  type        = number
  default     = null  # Set to null when auto-scaling is disabled
}