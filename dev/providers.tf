terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  profile = "dev"       # Specify the AWS CLI profile name
  region  = "us-east-2" # Specify the AWS region
}
