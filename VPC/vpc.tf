resource "aws_vpc" "Project" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
}