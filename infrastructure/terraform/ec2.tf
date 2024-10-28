resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "nfc-connect-server"
    Environment = var.environment
  }

  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name = var.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              EOF
}

resource "aws_security_group" "app_sg" {
  name        = "nfc-connect-sg"
  description = "Security group for NFC Connect application"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
