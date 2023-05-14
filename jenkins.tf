# Terraform version
terraform {
  required_version = ">= 1.0"
}

# Provider information
provider "aws" {
  region = var.location
}


# EC2 instance resource
resource "aws_instance" "example" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet-id
  security_groups = [aws_security_group.example.id]


  # Use provided bash script as user data
  user_data = file("${path.module}/jenkins.sh")

  tags = {
    Name = var.instance_name
  }
}


# Security group resource to allow access to ports
resource "aws_security_group" "example" {
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
