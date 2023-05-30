# Terraform version
terraform {
  required_version = ">= 1.0"
}

# Provider information
provider "aws" {
  alias  = "second"
  region = var.location
}


# EC2 instance resource
resource "aws_instance" "sonar" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet-id
  security_groups = [aws_security_group.sonar.id]


  # Use provided bash script as user data
  user_data = file("${path.module}/sonarqube.sh")

  tags = {
    Name = var.sonar_instance_name
  }
}


# Security group resource to allow access to ports
resource "aws_security_group" "sonar" {
  name_prefix = var.sg-name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.vpc-id
}
