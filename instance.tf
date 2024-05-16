resource "aws_instance" "public_instance" {
  ami               = "ami-04b70fa74e45c3917"
  instance_type      = "t2.medium"
  subnet_id         = aws_subnet.subnet-publica.id 

  tags = {
    nome = "Changer"
  }
  user_data       = <<-EOF
                      #!/bin/bash
                      sudo apt-get update
                      sudo apt-get install ca-certificates curl
                      sudo install -m 0755 -d /etc/apt/keyrings
                      sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
                      sudo chmod a+r /etc/apt/keyrings/docker.asc

                      echo \
                        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
                        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
                        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                      sudo apt-get update

                      sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

                      sudo docker run hello-world
                    EOF
}