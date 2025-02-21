resource "upcloud_managed_database_postgresql" "postgres" {
  name    = "modern-webapp-postgres"
  plan  = var.plan
  zone    = var.zone
  title = var.title

  network {
    family = var.network_family
    name = var.private_network_name
    type = "private"
    uuid = var.network_id
    }  
  properties {
    timezone       = var.timezone
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
}

