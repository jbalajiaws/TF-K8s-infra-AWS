#=========================
#Environment Variable
#=========================
variable "env" {
  type        = string
  description = "provide the env value"
  default     = "poc"
}

#=========================
#S3 Variable
#=========================
variable "bucket_name" {
  type        = string
  description = "Enter the bucket name"
  default     = "my_s3_bkt"
}

variable "vpc_id" {
  type    = string
  default = "vpc-xxxxxxxx"
}
