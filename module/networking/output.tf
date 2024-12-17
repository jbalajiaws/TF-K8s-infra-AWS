#=================
#VPC Ouput Values
#=================
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_name" {
  value = aws_vpc.my_vpc.tags
}

#=================
#Subnet Ouput Values
#=================

output "subnet_names" {
  description = "List of all subnet names (public and private)."
  value       = aws_subnet.my_subnets[*].tags.Name
}

output "subnet_ids" {
  description = "List of all subnet names (public and private)."
  value       = aws_subnet.my_subnets[*].id
}

output "public_subnets" {
  description = "List of public subnet names."
  value = [
    for subnet in aws_subnet.my_subnets :
    subnet.tags.Name if can(regex("public", subnet.tags.Name))
  ]
}

output "private_subnets" {
  description = "List of private subnet names."
  value = [
    for subnet in aws_subnet.my_subnets :
    subnet.tags.Name if can(regex("private", subnet.tags.Name))
  ]
}

#
#output "subnet_cidrs" {
#  description = "List of subnet CIDR blocks"
#  value       = [for subnet in aws_subnet.my_subnets : subnet.cidr_block]
#}
#
#output "subnet_azs" {
#  description = "List of subnet availability zones"
#  value       = [for subnet in aws_subnet.my_subnets : subnet.availability_zone]
#}

#=================
#IGW Ouput Values
#=================

output "igw_id" {
  value = aws_internet_gateway.my_igw.id
}

output "igw_name" {
  value = aws_internet_gateway.my_igw.tags
}

#======================
#Security Group Values
#======================

output "security_group_ids" {
  description = "The IDs of the security groups."
  value       = aws_security_group.my_sgs[*].id
}

output "security_group_names" {
  description = "The names of the security groups."
  value       = aws_security_group.my_sgs[*].name
}

