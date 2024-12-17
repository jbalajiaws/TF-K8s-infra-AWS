variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "version" {
  type        = string
  description = "The Kubernetes version for the EKS cluster"
  default     = "1.27"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS cluster will be created"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS cluster"
}

variable "sg_id" {
  type        = string
  description = "Security group ID for the EKS cluster"
}

variable "node_groups" {
  description = "Node group configuration for the EKS cluster"
  type = object({
    eks_nodes = object({
      desired_capacity = number
      max_capacity     = number
      min_capacity     = number
      instance_type    = string
    })
  })
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name for SSH access to the worker nodes"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources"
}
