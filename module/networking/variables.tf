#=========================
#Environment Variable
#=========================
variable "env" {
  type        = string
  description = "provide the env value"
  default     = "poc"
}
#================
#VPC Variables
#================

variable "vpc_cidr" {
  type        = string
  description = "provide the CIDR value to vpc"
  #default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type        = string
  description = "provide the tenancy value to vpc"
  default     = "default"
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

  default = [
    {
      name        = "web-sg"
      description = "Security group for web servers"
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
      ]
    }
  ]
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

