variable "zone" {
  description = "Deployment zone (region)"
  type        = string
}

variable "private_network_name" {
  description = "Name for the private network"
  type        = string
  default     = "private-network"
}

variable "network_family" {
  description = "Network family (e.g. IPv4)"
  type        = string
  default     = "IPv4"
}

variable "network_dhcp" {
  description = "Enable DHCP for the network"
  type        = bool
  default     = true
}

variable "internal_lb_plan" {
  description = "Plan for the internal load balancer"
  type        = string
  default     = "production-small"
}
variable "lb_address" {
  description = "CIDR for the Load balancer"
  type        = string
  default     = "10.10.0.0/24"
}
variable "uks_subnet" {
  description = "CIDR for the UKS cluster"
  type        = string
  default     = "10.10.1.0/24"
}

variable "db_subnet" {
  description = "CIDR for the Managed PostgreSQL instances"
  type        = string
  default     = "10.10.2.0/24"
}

variable "logging_subnet" {
  description = "CIDR for the Managed OpenSearch service"
  type        = string
  default     = "10.10.3.0/24"
}

variable "caching_subnet" {
  description = "CIDR for the Valkey caching service"
  type        = string
  default     = "10.10.4.0/24"
}
