
variable "client_id" {
  type        = string
  description = "Azure Client ID"
}

variable "aks_acr" {
  type        = string
  description = "Name of the resource group"
  default     = "aksacrpatient"
}

variable "aks_resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "lbs-rg"
}

variable "location" {
  type        = string
  description = "Azure region for AKS deployment"
  default     = "West Europe"
}
