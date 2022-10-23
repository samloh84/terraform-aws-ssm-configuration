
resource "aws_cloudwatch_log_group" "ssm_logs_cloudwatch_log_group" {
  name = var.cloudwatch_log_group_ssm_logs
  kms_key_id = aws_kms_key.ssm_kms_key.arn
  retention_in_days = var.retention_in_days
}

