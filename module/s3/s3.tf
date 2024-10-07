

resource "random_string" "s3_bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "${var.bucket_name}-${random_string.s3_bucket_suffix.result}"
  tags   = local.s3tags
}

##Update the S3 Bucket Policy to Restrict Access via the VPC Endpoint
resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        "Principal" : {
          "AWS" : "arn:aws:iam::095631761297:root"
        }
        Action = "s3:*"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.my_s3_bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.my_s3_bucket.id}/*"
        ]
        Condition = {
          StringNotEquals = {
            "aws:sourceVpce" = data.aws_vpc.vpcdata.id
          }
        }
      }
    ]
  })

}
