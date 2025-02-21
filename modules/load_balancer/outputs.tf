output "public_ip" {
  value = upcloud_loadbalancer.public.dns_name
}