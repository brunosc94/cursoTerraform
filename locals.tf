locals {
  ip_filepath = "file/ips.json"

  common_tags = {
    Name      = "TEST"
    Project   = "Course"
    Managedby = "Terraform"
    Environment = terraform.workspace
  }
}