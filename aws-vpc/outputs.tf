output "subnet_id" {
  description = "id da sua subnet"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "id da security group criada na aws"
  value       = aws_security_group.security_group.id
}