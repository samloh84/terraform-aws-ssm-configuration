variable "cloudwatch_log_group_ssm_logs" {
  type = string
  description = "Cloudwatch Log Group Name for SSM logs"
}

variable "s3_bucket_prefix_ssm_logs" {
  type = string
  description = "S3 Bucket Name Prefix for SSM logs"
}

variable "aws_principals" {
  type = list(string)
  description = "AWS Principals that can write to the SSM S3 Bucket"
}

variable "retention_in_days" {
  type = number
  default = 30
  description = "Retention of SSM Logs in Days"
}
