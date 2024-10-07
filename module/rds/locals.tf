locals {

  rds_tags = {
    Name       = join("_", [var.env, "rds", var.db_name])
    maintainer = "terraform"
    env        = var.env
  }
  vpc_security_group_ids = tolist([data.aws_security_group.all_sg.id])
  db_name                = var.engine == "mysql" || var.engine == "postgres" ? var.db_name : null

  #subnet_map = { for index, id in data.aws_subnets.all_subnets.ids : "subnet_${index}" => id }

  # Filtering public subnets based on the "pub" keyword in the name
  #  public_subnets = [
  #    for id, subnet in data.aws_subnet.subnet_details : id
  #    if can(regex("pubic", lower(subnet.tags["Name"])))
  #  ]

  # Filtering private subnets based on the "priv" keyword in the name
  #  private_subnets = [
  #    for id, subnet in data.aws_subnet.subnet_details : id
  #    if can(regex("private", lower(subnet.tags["Name"])))
  #  ]




}
