resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  count = 2
  ami                         = "ami-080e1f13689e07408"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-${var.environment}-${count.index}"
  }

}

resource "null_resource" "provision_install" {

  count = 1

  provisioner "file" {
    source      = "./install.sh"
    destination = "/tmp/install.sh"

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("./aws-key")
      host     = aws_instance.vm[0].public_ip
    }

  }
}

resource "null_resource" "provision_package" {

  count = 1

  provisioner "file" {
    source      = "./package.sh"
    destination = "/tmp/package.sh"

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("./aws-key")
      host     = aws_instance.vm[1].public_ip
    }

  }
}