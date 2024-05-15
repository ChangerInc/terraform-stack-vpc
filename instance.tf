resource "aws_instance" "public_instance" {
  ami               = "ami-04b70fa74e45c3917"
  insance_type      = "t2.medium"
  subnet_id         = aws_subnet.subnet-publica.id 

  tags = {
    nome = "Changer"
  }


}