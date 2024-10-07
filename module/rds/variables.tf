##=========================
##Environment Variable
##=========================
variable "env" {
  type    = string
  default = "poc"
}


variable "aws_region" {
  type        = string
  description = "AWS region to deploy the RDS instance"
  default     = "us-west-2"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage for the RDS instance in GB"
  default     = 20
}

variable "engine" {
  type        = string
  description = "The database engine to use (e.g. MySQL, PostgreSQL)"
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  description = "The version of the database engine"
  default     = "8.0.32"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
  default     = "db.t2.micro"
  #default = "db.r5.large"
}

variable "db_name" {
  type        = string
  description = "The name of the database"
  default     = "mydatabase"
}

variable "username" {
  type        = string
  description = "The master username for the database"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "The master password for the database"
  sensitive   = true
  default     = "defaultpassword"
}

variable "parameter_group_name" {
  type        = string
  description = "The name of the parameter group to associate with the DB instance"
  default     = "default.mysql8.0"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of VPC security groups to associate"
  default     = []
}

variable "db_subnet_group_name" {
  type        = string
  description = "The DB subnet group name"
  default     = "default-subnet-group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs"
  default     = []
}

variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "storage_type" {
  type        = string
  description = "The storage type to use (standard, gp2, io1)"
  default     = "gp2"
}

variable "publicly_accessible" {
  type        = bool
  description = "Whether the instance is publicly accessible"
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Whether to skip the final snapshot before deletion"
  default     = true
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain backups"
  default     = 7
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default = {
    Name        = "rds-instance"
    Environment = "development"
  }
}

variable "vpc_id" {
  type    = string
  default = "vpc-xxxxxxxx"
}
