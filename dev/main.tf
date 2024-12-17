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


module "eks" {
  depends_on      = [module.networking]
  source          = "../module/kubernetes"
  cluster_name    = "${var.env}-eks-cluster"
  version         = "1.27"  # Adjust the Kubernetes version if needed
  vpc_id          = module.networking.vpc_id
  subnet_ids      = module.networking.subnet_ids  # Subnets from networking module
  sg_id           = module.networking.security_group_ids[0]

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }

  key_name = var.key_name

  tags = {
    Environment = var.env
    Project     = "eks-cluster"
  }
}

