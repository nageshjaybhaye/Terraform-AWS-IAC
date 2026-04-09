resource "aws_key_pair" "my_key" {
  key_name   = "nagesh-deployer-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8R4xZ87WjSEh6rToH1aK48Kxw+SzkROE46p5GGyXZc hp@DESKTOP-89M9JM8"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id
  tags = {
    Name = "allow_tls"
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.my_key.key_name
  user_data = file("user_data.sh")
  security_groups = [aws_security_group.my-sg.name]
  count=var.server_count
  tags = {
    Name = var.instance_name
  }
  root_block_device {
        volume_size = var.volume_size
        volume_type = "gp3"
  }
}
