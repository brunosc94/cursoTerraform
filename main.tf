# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
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

data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*.1-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my-ec2-instance" {
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = var.instance_type
  tags          = var.instance_tags
}