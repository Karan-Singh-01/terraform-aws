output "security_group_id" {
  value = aws_security_group.app_sg.id
}

output "lb_security_group_id" {
  value = aws_security_group.lb_sg.id
}