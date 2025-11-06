variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33.3"
}

variable "default_node_count" {
  description = "Default node count for AKS"
  type        = number
  default     = 1
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = ""  # Optional if using env vars
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  default     = ""  # Optional if using env vars
}

variable "client_id" {
  description = "Azure client ID"
  type        = string
  default     = ""  # Optional if using env vars
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
  default     = ""  # Optional if using env vars
}