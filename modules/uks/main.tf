resource "upcloud_kubernetes_cluster" "cluster" {
  name                    = "modern-webapp-uks"
  control_plane_ip_filter = toset([var.uks_subnet])
  # The control_plane_ip_filter is used to specify which IP ranges can access the Kubernetes control plane.
  # It needs to be a set of CIDR ranges, not a single string.
  network             = var.uks_subnet_id
  zone                = var.zone
  plan                = var.plan
  private_node_groups = true
}

# Kubernetes cluster with private node groups requires a network that is routed through NAT gateway.
# The network must have DHCP enabled and a private network must be created.

# Create a Kubernetes cluster node group
resource "upcloud_kubernetes_node_group" "node_group" {
  cluster    = resource.upcloud_kubernetes_cluster.cluster.id
  node_count = var.node_count
  name       = var.node_group_name
  plan       = var.nodes_plan

  labels = {
    managedBy = "terraform"
  }
}