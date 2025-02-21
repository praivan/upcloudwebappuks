resource "upcloud_loadbalancer" "public" {
  name = "modern-webapp-public-lb"
  zone = var.zone
  plan = var.lb_plan

  networks {
    name    = "Private-Net"
    type    = "private"
    family  = var.network_family
    network = var.network_id
  }
  networks {
    name   = "Public-Net"
    type   = "public"
    family = var.network_family
  }
}