
variable "client_id" {
  type        = string
  description = "Azure Client ID"
  
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret"
  default     = "your-client-secret"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = "your-subscription-id"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  default     = "your-tenant-id"
}

variable "aks_resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "lgb-rgp"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the resource group"
  default     = "lgbtraiacct"
}

variable "aks_acr" {
  type        = string
  description = "Name of the resource group"
  default     = "aksstoracr"
}


variable "location" {
  type        = string
  description = "Azure region for AKS deployment"
  default     = "West Europe"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = "aksclusterpatient"
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



#variable "os_type" {
#  description = "The operating system type for the AKS node pool"
 # type        = string
 # default     = "Linux"  # or "Windows"
# }

variable "vnet_subnet_id" {
  type        = string
  description = "Subnet ID for AKS node pool"
  default     = "/subscriptions/your-subscription-id/resourceGroups/lbs-rg/providers/Microsoft.Network/virtualNetworks/aks-vnet/subnets/aks-subnet"
}



