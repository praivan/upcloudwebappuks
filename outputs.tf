# output "private_network_id" {
#   value = module.network.network_id
# }

output "uks_cluster_id" {
  value = module.uks.cluster_id
}

output "postgres_instance_id" {
  value = module.managed_postgres.instance_id
}

output "opensearch_instance_id" {
  value = module.opensearch.instance_id
}

output "valkey_instance_id" {
  value = module.valkey.instance_id
}

output "public_load_balancer_ip" {
  value = module.load_balancer.public_ip
}
