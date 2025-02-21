resource "upcloud_managed_database_opensearch" "opensearch" {
  name    = "modern-webapp-opensearch"
  title  = var.title
  plan  = var.plan
  zone    = var.zone
  properties {
    public_access = false
  }
  network {
    family = var.network_family
    name= var.logging_network_name
    type = "private"
    uuid = var.uuid
    }  
}
