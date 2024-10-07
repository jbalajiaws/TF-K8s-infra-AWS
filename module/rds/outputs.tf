# Usage of the retrieved Security Group ID
output "rds_specific_security_group_id" {
  value = data.aws_security_group.all_sg.id
}

output "rds_specific_security_group_name" {
  value = data.aws_security_group.all_sg.name
}


# Outputs to check the filtered subnets
output "rds_private_subnets" {
  value = data.aws_subnets.private_subnets
}

#output "rds_public_subnets" {
#  value = local.private_subnets
#}