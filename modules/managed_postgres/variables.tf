variable "plan" {
  description = "PostgreSQL plan in UpCloud"
  type        = string
  default     = "2x16xCPU-64GB-1500GB"
}
variable "zone" {
  description = "Deployment zone (region)"
  type        = string
  default     = "fi-hel2"
}
variable "title" {
  description = "PostgreSQL instance title in UpCloud"
  type        = string
  default     = "webapp-db"
}
variable "network_family" {
  description = "Network family (e.g. IPv4)"
  type        = string
  default     = "IPv4"
}
variable "network_id" {
  description = "ID of the private network"
  type        = string
}
variable "private_network_name" {
  description = "Name of the private network"
  type        = string
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

variable "timezone" {
  description = "Timezone for the database in PostgreSQL format"
  type        = string
  default     = "Europe/Helsinki"

}