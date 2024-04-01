resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}


resource "aws_instance" "web_server_prod" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  subnet_id              = data.terraform_remote_state.rs_state.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.rs_state.outputs.security_group_id]
  user_data              = file("./packages.sh")
  associate_public_ip_address = true

  tags = {
    Name = "Web_Server_01_TF"
  }

  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} >> public_ip.txt"
  }


}