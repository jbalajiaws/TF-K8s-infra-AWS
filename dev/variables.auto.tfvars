##=========================
##Environment Variable
##=========================
env = "dev"

#=========================
#VPC Value for variables
#=========================
vpc_cidr = "11.0.0.0/16"

#vpc_tags = {
#  name       = "Dev_VPC"
#  maintainer = "terraform"
#  env        = "dev"
#}

#=========================
#Subnet Value for variables
#=========================

subnet_config = [
  {
    name                    = "dev_pub_subnet-1"
    cidr_block              = "11.0.1.0/24"
    availability_zone       = "us-east-2a"
    map_public_ip_on_launch = true
  },
  {
    name                    = "dev_priv_subnet-1"
    cidr_block              = "11.0.2.0/24"
    availability_zone       = "us-east-2a"
    map_public_ip_on_launch = false
  },
  {
    name                    = "dev_pub_subnet-2"
    cidr_block              = "11.0.3.0/24"
    availability_zone       = "us-east-2b"
    map_public_ip_on_launch = true
  },
  {
    name                    = "dev_priv_subnet-2"
    cidr_block              = "11.0.4.0/24"
    availability_zone       = "us-east-2b"
    map_public_ip_on_launch = false
  }
]


#=========================
#Security Group Value for variables
#=========================

security_group_config = [
  {
    name = "web-sg"
    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP"
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTPS"
      }
      #      {
      #        from_port   = 22
      #        to_port     = 22
      #        protocol    = "ssh"
      #        cidr_blocks = ["0.0.0.0/0"]
      #        description = "Allow SSH"
      #      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
      }
    ]
  },
  {
    name        = "db-sg"
    description = "Security group for database servers"
    ingress_rules = [
      {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "Allow PostgreSQL"
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
      }
      #      {
      #        from_port   = 22
      #        to_port     = 22
      #        protocol    = "ssh"
      #        cidr_blocks = ["11.0.0.0/16"]
      #        description = "Allow SSH"
      #      }
    ]
  }
]

#=========================
#Subnet Value for variables
#=========================
vpc_endpoint_config = [
  {
    name                = "s3_endpoint"
    vpc_endpoint_type   = "Gateway" # e.g., Gateway, Interface, Gateway Load Balancer
    service_name        = "com.amazonaws.us-east-2.s3"
    subnet_ids          = null
    security_group_ids  = null
    route_table_ids     = null
    private_dns_enabled = false
    tags = {
      Name       = "s3_endpoint"
      maintainer = "terraform"
    }
  }
]

#==============================
#S3 Bucket Value for variables
#==============================
bucket_name = "my-s3"

vpc_id = "vpc_adfdfehr"

#=========================
#RDS Value for variables
#=========================

