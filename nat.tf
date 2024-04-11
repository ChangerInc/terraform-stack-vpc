resource "aws_nat_gateway" "nat" {
  subnet_id         = aws_subnet.subnet-publica.id
  connectivity_type = "public"
  allocation_id     = aws_eip.elastic_ip.id


  tags = {
    Name = "NAT Gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}