variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "instance_type" {
  type = string
}

variable "instance_tags" {
  type = map(any)
}