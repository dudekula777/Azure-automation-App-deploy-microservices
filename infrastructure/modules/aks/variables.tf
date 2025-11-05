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