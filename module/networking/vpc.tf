resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  tags             = local.vpc_tags
}

