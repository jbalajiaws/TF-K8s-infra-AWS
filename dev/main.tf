module "networking" {
  source                = "../module/networking"
  vpc_cidr              = var.vpc_cidr
  env                   = var.env
  subnet_config         = var.subnet_config
  security_group_config = var.security_group_config
  vpc_endpoint_config   = var.vpc_endpoint_config
}

module "s3" {
  depends_on  = [module.networking]
  source      = "../module/s3"
  bucket_name = var.bucket_name
  vpc_id      = module.networking.vpc_id

}

module "rds" {
  depends_on              = [module.networking]
  source                  = "../module/rds"
  env                     = var.env
  allocated_storage       = 21
  engine                  = "mysql"
  engine_version          = "8.0.32"
  instance_class          = "db.r5.large"
  username                = "admin"
  password                = "9677jo549415"
  parameter_group_name    = "default.mysql8.0"
  multi_az                = false
  storage_type            = "gp2"
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 1
  vpc_id                  = module.networking.vpc_id

  db_subnet_group_name = "rds_subnet_group"
}

