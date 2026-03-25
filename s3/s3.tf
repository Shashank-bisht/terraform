terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "shashank-terraform-demo-bucket-12345"

  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object" {
  bucket = "shashank-terraform-demo-bucket-12345"
  key    = "shashank1.txt"
  source = "shanky.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("shanky.txt")
}

