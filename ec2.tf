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
  tags          = local.common_tags
}