terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = "my-tf-test-bucket-00770044"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "acl_s3Bucket" {
  bucket = aws_s3_bucket.s3Bucket.id
  acl    = "private"
}