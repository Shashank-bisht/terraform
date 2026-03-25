terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
}

provider "aws" {
  region = "us-east-1"   # Always define region
}

resource "aws_instance" "my_first_instance" {
  count         = 2
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"

  tags = {
    Name = "instance-${count.index + 1}"
  }
}