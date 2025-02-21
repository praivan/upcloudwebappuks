resource "upcloud_managed_database_valkey" "valkey" {
  name  = "webapp-valkey"
  title = var.title
  plan  = var.plan
  zone  = var.zone

  properties {
    public_access = false
  }
  network {
    family = var.network_family
    name   = var.caching_network_name
    type   = "private"
    uuid   = var.uuid
  }
}