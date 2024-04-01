output "public_ip" {
  value = aws_instance.web_server_prod.public_ip
}