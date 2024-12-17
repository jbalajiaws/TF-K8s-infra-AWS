#=================
#VPC Ouput Values
#=================
output "vpc_id" {
  value = module.networking.vpc_id
}

output "vpc_name" {
  value = module.networking.vpc_name
}

#=================
#Subnet Ouput Values
#=================
#output "subnet_ids" {
#  description = "List of subnet IDs"
#  value       = [for subnet in module.vpc.subnet_ids : subnet.id]
#}
#
#output "subnet_cidrs" {
#  description = "List of subnet CIDR blocks"
#  value       = [for subnet in module.vpc.subnet_cidrs : subnet.cidr_block]
#}
#
#output "subnet_azs" {
#  description = "List of subnet availability zones"
#  value       = [for subnet in module.vpc.subnet_azs : subnet.availability_zone]
#}

#=================
#IGW Ouput Values
#=================

output "igw_id" {
  value = module.networking.igw_id
}

output "igw_name" {
  value = module.networking.igw_name
}
#======================
#Security Group Values
#======================

output "security_group_ids" {
  description = "The IDs of the security groups."
  value       = module.networking.security_group_ids
}

output "security_group_names" {
  description = "The names of the security groups."
  value       = module.networking.security_group_names
}
#======================
#Subnet  Values
#======================

output "subnet_names" {
  description = "List of all subnet names (public and private)."
  value       = module.networking.subnet_names
}

output "public_subnets" {
  description = "List of public subnet names."
  value       = module.networking.public_subnets
}

output "private_subnets" {
  description = "List of private subnet names."
  value       = module.networking.private_subnets
}

output "subnet_ids" {
  description = "List of all subnet names (public and private)."
  value       = module.networking.subnet_ids
}

#======================
#S3  Values
#======================

# Usage of the retrieved Security Group ID
output "specific_security_group_id" {
  value = module.rds.rds_specific_security_group_id
}

output "specific_security_group_name" {
  value = module.rds.rds_specific_security_group_name
}

# Outputs to check the filtered subnets
output "rds_private_subnets" {
  value = module.rds.rds_private_subnets
}

#output "rds_public_subnets" {
#  value = module.rds.rds_private_subnets
#}
#======================
#K8S  Values
#======================

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}