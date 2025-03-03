output "dns_name" {
  value = aws_lb.main.dns_name
}

output "security_group" {
  value = aws_security_group.lb_sg.id
}