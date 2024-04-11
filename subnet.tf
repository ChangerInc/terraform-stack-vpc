resource "aws_subnet" "subnet-publica" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.0/25"

  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "publica"
  }
}

resource "aws_subnet" "subnet-privada" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "privada"
  }
}
