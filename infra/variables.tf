variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

# -----------------------------
# Azure Authentication Variables
# -----------------------------
variable "client_id" {
  type        = string
  description = "Azure Client ID (Service Principal Application ID)"
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

# -----------------------------
# Infrastructure Settings
# -----------------------------
variable "aks_resource_group" {
  type        = string
  description = "Name of the resource group for AKS and other resources"
  default     = "lgb-resourcegroup"
}

variable "storage_account_name" {
  type        = string
  description = "Azure Storage Account name for Terraform state backend"
  default     = "lgbstorage"
}

variable "aks_acr" {
  type        = string
  default     = "lbgacr1989"
  description = "Azure Container Registry name"
}

variable "nodepool_name" {
  description = "Name of the default AKS node pool"
  type        = string
  default     = "lbgnodepool"
}
variable "aks_acr_name" {
  type        = string
  description = "Name of the Azure Container Registry for AKS"
  default     = "lbgacr1989"
}


variable "location" {
  type        = string
  description = "Azure region for AKS deployment"
  default     = "canadacentral" # corrected region name
}

# -----------------------------
# AKS Cluster Configuration
# -----------------------------
variable "cluster_name" {
  type        = string
  description = "AKS Cluster name"
  default     = "lbg-aks-cluster"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "node_vm_size" {
  type        = string
  description = "VM size for the AKS nodes"
  default     = "Standard_D2s_v4"
}

# -----------------------------
# Networking Configuration
# -----------------------------
variable "vnet_subnet_id" {
  type        = string
  description = "Subnet ID for AKS node pool"
  default     = ""
}
