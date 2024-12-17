##=========================
##Environment Variable
##=========================
variable "env" {
  type = string
}

#=====================
# Variables of VPC
#=====================
variable "vpc_cidr" {
  type = string
}

#=================
#Subnet Variables
#=================

variable "subnet_config" {
  description = "List of subnet configurations"
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))
  #  default = [
  #    {
  #      name                    = "pub_subnet-1"
  #      cidr_block              = "10.0.1.0/24"
  #      availability_zone       = "us-east-2a"
  #      map_public_ip_on_launch = true
  #    },
  #    {
  #      name                    = "priv_subnet-1"
  #      cidr_block              = "10.0.2.0/24"
  #      availability_zone       = "us-east-2b"
  #      map_public_ip_on_launch = false
  #    }
  #  ]

}

#=========================
#Security Group Variable
#=========================
variable "security_group_config" {
  description = "A list of security group configurations."
  type = list(object({
    name = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
  }))
}
#=========================
#SVPC Endpoint Variable
#=========================

variable "vpc_endpoint_config" {
  description = "List of VPC endpoint configurations."
  type = list(object({
    name                = string
    vpc_endpoint_type   = string # e.g., Gateway, Interface, Gateway Load Balancer
    service_name        = string
    subnet_ids          = list(string)
    security_group_ids  = list(string)
    route_table_ids     = list(string)
    private_dns_enabled = bool
    tags                = map(string)
  }))
}

#=========================
#S3 Variable
#=========================
variable "bucket_name" {
  type = string
}

variable "vpc_id" {
  type = string
}


##=========================
##RDS Variable
##=========================


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

##=========================
##K8S Variable
##=========================

variable "key_name" {
  description = "EC2 key pair name for SSH access to EKS worker nodes"
  type        = string
  default     = ""  # If you don't need SSH access, you can leave this blank or omit it.
}

variable "instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}
