resource "aws_s3_bucket" "ssm_logs_s3_bucket" {
  bucket = var.s3_bucket_ssm_logs
  force_destroy = true
}

resource "aws_s3_bucket_acl" "ssm_logs_s3_bucket_acl" {
  bucket = aws_s3_bucket.ssm_logs_s3_bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ssm_logs_s3_bucket_sse_config" {
  bucket = aws_s3_bucket.ssm_logs_s3_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.ssm_kms_key.arn
    }
    bucket_key_enabled = true
  }
}
