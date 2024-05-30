output "lb_dns_name" {
  value = module.alb.lb_dns_name
}

output "target_group_arns" {
  value = module.alb.target_group_arns
}

output "instance_public_ips" {
  value = data.aws_instances.asg_instances.public_ips
}