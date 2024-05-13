resource "aws_internet_gateway" "igw" {
  vpc_id            = aws_vpc.vpc-01.id
  subnet_id         = aws_subnet.subnet-privada.id


  tags = {
    Name = "prod"
  }
}