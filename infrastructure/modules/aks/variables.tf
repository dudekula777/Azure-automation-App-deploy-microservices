variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for AKS"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "default_node_count" {
  description = "Default node count"
  type        = number
}

variable "availability_zones" {
  description = "Availability zones for the node pool. Check region support before enabling."
  type        = list(string)
  default     = null  # Change from [] to null
  validation {
    condition = var.availability_zones == null || (
      length(var.availability_zones) > 0 && 
      length(var.availability_zones) <= 3
    )
    error_message = "Availability zones must be null or between 1-3 zones."
  }
}

variable "vm_size" {
  description = "VM size for AKS nodes. Some sizes don't support availability zones in all regions."
  type        = string
  default     = "Standard_DS2_v2"  # Use a zone-supporting size if needed
}