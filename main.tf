module "network" {
  source               = "./modules/network"
  zone                 = var.zone
  private_network_name = var.private_network_name
  network_family       = var.network_family
  network_dhcp         = var.network_dhcp
}

module "uks" {
  source                  = "./modules/uks"
  zone                    = var.zone  
  uks_subnet              =  module.network.uks_subnet
  uks_subnet_id           = module.network.network_ids["uks"]
  node_count              = var.uks_node_count
}

module "managed_postgres" {
  source               = "./modules/managed_postgres"
  zone                 = var.zone
  network_id           = module.network.network_ids["db"]
  private_network_name = module.network.db_network_name
  admin_username       = var.admin_username
  admin_password       = var.admin_password
}

module "opensearch" {
  source               = "./modules/opensearch"
  zone                 = var.zone
  logging_network_name = module.network.logging_network_name
  uuid                 = module.network.network_ids["logging"]
}

module "valkey" {
  source     = "./modules/valkey"
  zone     = var.zone
  caching_network_name = module.network.caching_network_name
  uuid = module.network.network_ids["caching"]
}

module "load_balancer" {
  source             = "./modules/load_balancer"
  zone               = var.zone
  tls_certificate_id = var.tls_certificate_id
  network_id         = module.network.network_ids["uks"]
}
