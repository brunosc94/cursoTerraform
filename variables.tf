variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_tags" {
  type = map(any)
  default = {
    Name      = "Instance-TerraformCourse"
    Project   = "Course"
    Managedby = "Terraform"
  }
}