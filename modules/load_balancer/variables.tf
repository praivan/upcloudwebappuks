variable "zone" {
  description = "Deployment zone (region)"
  type        = string
}

variable "tls_certificate_id" {
  description = "TLS certificate ID for HTTPS (if applicable)"
  type        = string
  default     = ""
}

variable "network_id" {
  description = "ID of the private network to attach the load balancer to"
  type        = string
}

variable "network_family" {
  description = "Network family (e.g. IPv4)"
  type        = string
  default     = "IPv4"
}

variable "lb_plan" {
  description = "Plan for the load balancer"
  type        = string
  default     = "production-small"
}