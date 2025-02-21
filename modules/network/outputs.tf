output "nat_gateway_id" {
  value = upcloud_gateway.nat.id
}

output "internal_lb_id" {
  value = upcloud_loadbalancer.internal.id
}

output "uks_subnet" {
  value = upcloud_network.uks_network.ip_network[0].address
}

output "uks_subnet_id" {
  value = upcloud_network.uks_network.id
}

output "db_network_name" {
value = upcloud_network.db_network.name
}

output "logging_network_name" {
value = upcloud_network.logging_network.name
}

output "caching_network_name" {
value = upcloud_network.caching_network.name
}


# Update outputs to reflect multiple networks
output "network_ids" {
  value = {
    uks     = upcloud_network.uks_network.id
    db      = upcloud_network.db_network.id
    logging = upcloud_network.logging_network.id
    caching = upcloud_network.caching_network.id
  }
}
