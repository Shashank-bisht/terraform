terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create the security group
resource "aws_security_group" "http_and_ssh" {
  name        = "http_and_ssh"
  description = "Allow HTTP and SSH access"

  # Allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the EC2 instance
resource "aws_instance" "myserver" {
  ami           = "ami-0e86e20dae9224db8" # Ensure this AMI ID is valid in your region
  instance_type = "t3.micro"
  security_groups = [aws_security_group.http_and_ssh.name]

  # Optionally, you might want to specify a key_name for SSH access
  key_name = "new"

  # Optionally, add tags
  tags = {
    Name = "MyServer"
  }
}

# Output the public IP of the instance
output "instance_ip_addr" {
  value = aws_instance.myserver.public_ip
}
