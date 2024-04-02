resource "aws_vpc" "vpc_test" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_test" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = "10.0.1.0/24"

}

resource "aws_internet_gateway" "ig_test" {
  vpc_id = aws_vpc.vpc_test.id

}

resource "aws_route_table" "route_table_test" {
  vpc_id = aws_vpc.vpc_test.id

  route = []
}

resource "aws_main_route_table_association" "rta_test" {
  vpc_id         = aws_vpc.vpc_test.id
  route_table_id = aws_route_table.route_table_test.id
}

resource "aws_security_group" "security_group_test" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_test.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv4         = aws_vpc.vpc_test.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv4         = aws_vpc.vpc_test.cidr_block
  from_port         = 0
  ip_protocol       = "tcp" 
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}