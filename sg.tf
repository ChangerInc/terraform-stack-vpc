resource "aws_security_group" "security_publico" {
  name        = "Security group publico"
  description = "Permite entrada e saida no grupo de seguranca"
  vpc_id      = aws_vpc.vpc-01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group publico"
  }
}


resource "aws_security_group" "security_privado" {
  name        = "Security group privado"
  description = "Permite entrada e saida no grupo de seguranca"
  vpc_id      = aws_vpc.vpc-01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group privado"
  }
}


resource "aws_vpc_security_group_ingress_rule" "https_publico" {
  security_group_id = aws_security_group.security_publico.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_privado" {
  security_group_id = aws_security_group.security_privado.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

}

resource "aws_vpc_security_group_ingress_rule" "http_publico" {
  security_group_id = aws_security_group.security_publico.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "http_privado" {
  security_group_id = aws_security_group.security_privado.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80  
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_publico" {
  security_group_id = aws_security_group.security_publico.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

}


resource "aws_vpc_security_group_egress_rule" "ssh_privado" {
  security_group_id = aws_security_group.security_privado.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol          = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "banco_publico" {
  security_group_id = aws_security_group.security_publico.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306

}


resource "aws_vpc_security_group_egress_rule" "banco_privado" {
  security_group_id = aws_security_group.security_privado.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  to_port           = 3306
  ip_protocol          = "tcp"
}
