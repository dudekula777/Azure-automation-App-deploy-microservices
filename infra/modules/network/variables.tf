variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "lbs-aks-vnet"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
  default     = "canadacentral" # ✅ corrected region
}

variable "aks_resource_group" {
  type        = string
  description = "Name of the Resource Group"
  default     = "lgb-resourcegroup"
}