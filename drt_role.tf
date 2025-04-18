resource "aws_iam_role" "DRT" {
  name = "drt_dalkia_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "drt.shield.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "DRT_Attachment" {
  role       = aws_iam_role.DRT.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy"
}

resource "aws_shield_drt_access_role_arn_association" "DRT_Access" {
  role_arn = aws_iam_role.DRT.arn
}

resource "aws_shield_drt_access_log_bucket_association" "test" {
  log_bucket              = var.shield_drt_access_log_bucket
  role_arn_association_id = aws_shield_drt_access_role_arn_association.DRT_Access.id
}

resource "aws_s3_bucket" "drt_log_bucket" {
  bucket = "Dalkia-DRT-Logs"

  tags = {
    Name        = "drt-log-bucket"
    Environment = "production"
  }
}

resource "aws_s3_bucket_acl" "drt_log_bucket_acl" {
  bucket = aws_s3_bucket.drt_log_bucket.bucket
  acl    = "private"
}

variable "shield_drt_access_log_bucket" {
  description = "The S3 bucket for Shield DRT access logs"
}
