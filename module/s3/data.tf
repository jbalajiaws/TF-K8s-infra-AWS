##data "aws_vpcs" "all" {}
#
#
#
data "aws_vpc" "vpcdata" {
  id = var.vpc_id
}


#
#
##data "aws_vpc" "my_vpc_data" {
##  id = data.aws_vpcs.all.ids[0]
##}
#
#
#
##data "aws_vpc_endpoint" "s3_endpoint" {
##  #  filter {
##  #    name   = "vpc-id"
##  #    values = [var.vpc_id]
##  #  }
##
##  filter {
##    name   = "service-name"
##    values = ["com.amazonaws.us-east2.s3"]
##  }
##  filter {
##    name   = "vpc-endpoint-type"
##    values = ["Gateway"]
##  }
##}
#
#

