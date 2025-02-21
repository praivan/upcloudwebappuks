variable "upcloud_username" {
  description = "UpCloud account username"
  type        = string
}

variable "upcloud_password" {
  description = "UpCloud account password"
  type        = string
  sensitive   = true
}

variable "zone" {
  description = "UpCloud zone (region) to deploy resources (e.g. fi-hel1)"
  type        = string
  default     = "fi-hel2"
}

variable "private_network_name" {
  description = "Name of the private network"
  type        = string
  default     = "private-network"
}

variable "network_address" {
  description = "Base address for the network (e.g. 10.0.0.0)"
  type        = string
  default     = "10.0.0.0"
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

variable "tls_certificate_id" {
  description = "TLS certificate ID for HTTPS listener (if applicable)"
  type        = string
  default     = ""
}

variable "uks_node_count" {
  description = "Number of worker nodes for the Kubernetes cluster"
  type        = number
  default     = 24
}
variable "admin_username" {
  description = "PostgreSQL administartor username"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
  default     = "YOUR_ADMIN_PASSWORD"
}