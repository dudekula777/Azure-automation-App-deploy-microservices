##########################################
# VARIABLES
##########################################
variable "location" {
  type        = string
  description = "Azure region for deployment"
}

variable "aks_resource_group" {
  type        = string
  description = "Resource group for AKS and ACR"
}

variable "aks_acr_name" {
  type        = string
  description = "Name of the Azure Container Registry (must be globally unique)"
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name to assign ACR permissions to"
}