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
variable "acr_id" {
  description = "The ID of the Azure Container Registry"
  type        = string
  default     = ""
}