#data "aws_vpc" "vpcdatards" {
#  filter {
#    name   = "tag:Name"
#    values = ["${join("_", [var.env, "vpc"])}"]
#  }
#
#}

data "aws_vpc" "vpcdatards" {
  id = var.vpc_id
}

#data "aws_subnets" "all_subnets" {
#  filter {
#    name   = "vpc-id"
#    values = [data.aws_vpc.vpcdatards.id]
#  }
#}
#
#data "aws_subnet" "subnet_details" {
#  for_each = local.subnet_map
#  id       = each.key
#}
data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpcdatards.id]
  }
}


#data "aws_subnet" "subnet_details" {
#  for_each = toset(data.aws_subnets.all_subnets.ids)
#  id       = each.value
#}


data "aws_security_group" "all_sg" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpcdatards.id]
  }

  filter {
    name   = "group-name"
    values = ["db-sg"] # Replace with the name of the security group you want to fetch
  }

}





