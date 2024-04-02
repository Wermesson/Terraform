output "subnet_id" {
  description = "id da subnet"
  value       = aws_subnet.subnet_test.id
}

output "vpc_arn" {
  description = "arn da vpc"
  value       = aws_vpc.vpc_test.arn
}

output "vpc_id" {
  description = "id da vpc"
  value       = aws_vpc.vpc_test.id
}

