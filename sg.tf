resource "aws_security_group" "sg_publica" {
  name        = "security_group_publica"
  description = "Permite entrada e saída da internet"
  vpc_id      = aws_vpc.vpc-01

  tags = {
    Name = "SG publica"
  }
}

resource "aws_vpc_security_group_ingress_rule" "permite_ssh" {
  security_group_id = aws_security_group.sg_publica.id
  cidr_ipv4         = vpc.aws_vpc.vpc-01.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_publica.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
