variable "zone" {
  description = "Deployment zone for the Kubernetes cluster"
  type        = string
  default = "fi-hel2"
}

variable "plan" {
  description = "UpCloud plan for the Kubernetes cluster"
  type        = string
  default = "production-small"
}

variable "node_group_name" {
  description = "Kubernetes cluster node group name"
  type        = string
  default = "webapp-node-group"
}

variable "nodes_plan" {
  description = "Kubernetes cluster nodes plan"
  type        = string
  default = "CLOUDNATIVE-1xCPU-4GB"
}

variable "node_count" {
  description = "Number of nodes deployed in Kubernetes cluster"
  type        = number
  default = 24
}

variable "uks_subnet" {
  description = "Control plane IP filter"
  type        = string
}

variable "uks_subnet_id" {
  description = "ID of the UKS private network"
  type        = string
}

