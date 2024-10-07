locals {

  s3tags = {
    Name : join("_", [var.env, var.bucket_name])
  }


}
