resource "tls_private_key" "rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name    = var.key_name
  public_key  = tls_private_key.rsa-4096.public_key_openssh
}

resource "local_file" "private_key"