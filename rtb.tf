resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


}

resource "aws_route_table" "privada" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


}

resource "aws_route_table_association" "associacao_privada" {
  subnet_id      = aws_subnet.subnet-privada.id
  route_table_id = aws_route_table.privada.id
}

resource "aws_route_table_association" "associacao_publica" {
  subnet_id      = aws_subnet.subnet-publica.id
  route_table_id = aws_route_table.publica.id
}