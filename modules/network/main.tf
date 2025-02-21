# This Terraform configuration defines multiple UpCloud network resources. 
# The configuration creates a private network load balancer network, and four additional networks for UKS, database, logging, and caching. 
# The configuration also creates an UpCloud router named internal_router, a NAT gateway, and an internal load balancer. 


resource "upcloud_network" "lb_network" {
  name = "lb-test-net"
  zone = var.zone
  ip_network {
    address = var.lb_address
    dhcp    = var.network_dhcp
    family  = var.network_family
  }
}

resource "upcloud_network" "uks_network" {
  name   = "${var.private_network_name}-uks"
  zone   = var.zone
  router = upcloud_router.internal_router.id

  ip_network {
    address           = var.uks_subnet
    family            = var.network_family
    dhcp              = var.network_dhcp
    dhcp_default_route = true
  }
}

resource "upcloud_network" "db_network" {
  name   = "${var.private_network_name}-db"
  zone   = var.zone
  router = upcloud_router.internal_router.id

  ip_network {
    address = var.db_subnet
    family  = var.network_family
    dhcp    = var.network_dhcp
  }
}

resource "upcloud_network" "logging_network" {
  name   = "${var.private_network_name}-logging"
  zone   = var.zone
  router = upcloud_router.internal_router.id

  ip_network {
    address = var.logging_subnet
    family  = var.network_family
    dhcp    = var.network_dhcp
  }
}

resource "upcloud_network" "caching_network" {
  name   = "${var.private_network_name}-caching"
  zone   = var.zone
  router = upcloud_router.internal_router.id

  ip_network {
    address = var.caching_subnet
    family  = var.network_family
    dhcp    = var.network_dhcp
  }
}

# This resource creates an UpCloud router named "internal_router" which is used to manage network traffic within the UpCloud environment.
resource "upcloud_router" "internal_router" {
  name = "internal_router"
}
resource "upcloud_gateway" "nat" {
  name       = "nat-gateway"
  zone       = var.zone
  features = [ "nat" ]
  router {
    id = upcloud_router.internal_router.id
  }
}

resource "upcloud_loadbalancer" "internal" {
  configured_status = "started"
  name    = "${var.private_network_name}-internal-lb"
  zone    = var.zone
  plan    = var.internal_lb_plan
 
  networks {
    name    = "Private-Net"
    type    = "private"
    family  = var.network_family
    network = upcloud_network.lb_network.id
  }
  networks {
    name   = "Public-Net"
    type   = "public"
    family = var.network_family
  }
}

