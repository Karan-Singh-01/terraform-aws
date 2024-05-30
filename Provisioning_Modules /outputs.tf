output "dns_name" {
  value = module.application.lb_dns_name
}

output "instance_public_ips" {
  value = module.application.instance_public_ips
}
