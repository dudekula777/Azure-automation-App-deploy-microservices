
variable "vnet_name" {
   type        = string
  description = "Name of the AKS cluster"
  default     = "lbs-aks-vnet"
}



variable "location" {
  type        = string
  description = "Azure region for AKS deployment"
  default     = "West Europe"
}

variable "aks_resource_group" {
   type        = string
  description = "Name of the resource group"
  default     = "lbs-rg"
}
