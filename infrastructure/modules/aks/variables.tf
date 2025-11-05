variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 1
}

variable "vnet_subnet_id" {
  description = "Virtual Network Subnet ID for AKS"
  type        = string
}

variable "service_cidr" {
  description = "Kubernetes service CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP"
  type        = string
  default     = "10.0.0.10"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.27.9"
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "availability_zones" {
  description = "Availability zones for the node pool"
  type        = list(string)
  default     = null
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the node pool"
  type        = bool
  default     = false
}

variable "min_count" {
  description = "Minimum node count for auto-scaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum node count for auto-scaling"
  type        = number
  default     = 3
}

# REMOVE THESE DUPLICATES - they should be in your environment variables.tf, not module variables.tf
# variable "environment" {
#   description = "Environment name"
#   type        = string
#   default     = "dev"
# }
#
# variable "location" {
#   description = "Azure region"
#   type        = string
#   default     = "East US"
# }
#
# variable "kubernetes_version" {
#   description = "Kubernetes version"
#   type        = string
#   default     = "1.27"
# }
#
# variable "default_node_count" {
#   description = "Default node count for AKS"
#   type        = number
#   default     = 2
# }
#
# variable "subscription_id" {
#   description = "Azure subscription ID"
#   type        = string
#   default     = "" 
# }
#
# variable "tenant_id" {
#   description = "Azure tenant ID"
#   type        = string
#   default     = "" 
# }
#
# variable "client_id" {
#   description = "Azure client ID"
#   type        = string
#   default     = "" 
# }
#
# variable "client_secret" {
#   description = "Azure client secret"
#   type        = string
#   sensitive   = true
#   default     = "" 
# }