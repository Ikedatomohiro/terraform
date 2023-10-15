provider "aws" {
  profile = "terraform_user"
  region = "ap-northeast-1"
}

resource "aws_instance" "hello-world" {
  ami = "ami-0fd8f5842685ca887"
  instance_type = "t2.micro"

  tags = {
    Name = "Hello world"
  }

  user_data = <<EOF
#!/bin/bash
amazon-linux-extras install -y nginx1.12
systemctl start nginx
EOF
}