resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "web_prod" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  subnet_id                   = data.terraform_remote_state.rs_state.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.rs_state.outputs.security_group_id]
  associate_public_ip_address = true 
  user_data = file("./packages.sh")
  key_name = aws_key_pair.key.key_name

  tags = {
    Name = "SRV-Web-Prod"
  }
}