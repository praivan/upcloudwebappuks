variable "title" {
  description = "Title of OpenSearch instance in UpCloud"
  type        = string
  default     = "webapp-opensearch"
}

variable "plan" {
  description = "OpenSearch plan in UpCloud"
  type        = string
  default     = "3x2xCPU-4GB-600GB-7D"
}

variable "zone" {
  description = "Deployment zone (region)"
  type        = string
  default     = "fi-hel2"
}

variable "network_family" {
  description = "Network family (e.g. IPv4)"
  type        = string
  default     = "IPv4"
}

variable "logging_network_name" {
  description = "Name of logging network"
  type        = string
}
variable "uuid" {
  description = "Logging network UUID"
  type        = string
}
