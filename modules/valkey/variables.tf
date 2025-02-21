variable "title" {
  description = "Title of the Valkey instance in UpCloud" 
  type        = string
  default = "webapp-valkey"
}
variable "plan" {
  description = "Valkey plan"
  type        = string
  default = "2x8xCPU-56GB"
}
variable "zone" {
  description = "Deployment zone (region)"
  type        = string
  default    = "fi-hel2"
}
variable "network_family" {
  description = "Network family (e.g. IPv4)"
  type        = string
  default = "IPv4"
}

variable "caching_network_name" {
  description = "Name of caching network"
  type        = string
}
variable "uuid" {
  description = "Logging network UUID"
  type        = string
}