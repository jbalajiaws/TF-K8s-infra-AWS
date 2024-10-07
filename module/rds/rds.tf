resource "aws_db_instance" "my_rds" {
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = local.db_name
  username                = var.username
  password                = var.password
  parameter_group_name    = var.parameter_group_name
  vpc_security_group_ids  = local.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.my_subnet_group.name
  multi_az                = var.multi_az
  storage_type            = var.storage_type
  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period


  tags = local.rds_tags
}

resource "aws_db_subnet_group" "my_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = data.aws_subnets.private_subnets.ids

  tags = {
    Name = var.db_subnet_group_name
  }
}


