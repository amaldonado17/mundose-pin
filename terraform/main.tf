provider "aws" {
  region = "us-east-1" # Cambia esto según tu región preferida
}

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # AMI de Amazon Linux 2 o la que prefieras
  instance_type = "t2.micro" # Tipo de instancia, ajusta según tus necesidades

  tags = {
    Name = "apache-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
