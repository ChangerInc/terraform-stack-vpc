resource "aws_subnet" "subnet-publica" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "publica"
  }
}

resource "aws_subnet" "subnet-privada" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "privada"
  }
}