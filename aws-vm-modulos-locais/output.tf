output "vm_ip" {
  description = "ip da vm"
  value       = aws_instance.vm.public_ip
}