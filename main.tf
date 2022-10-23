/**
 * # AWS Systems Manager Session Manager Configuration
 *
 * This Terraform module creates a default AWS Systems Manager Session Manager Configuration
 *
 *
 *
 */

locals {
  ssm_document_content = jsonencode({
    schemaVersion = "1.0"
    description = "Document to hold regional settings for Session Manager"
    sessionType = "Standard_Stream"
    inputs = {
      cloudWatchLogGroupName = aws_cloudwatch_log_group.ssm_logs_cloudwatch_log_group.name
      cloudWatchEncryptionEnabled = true
      cloudWatchStreamingEnabled = true
      kmsKeyId = aws_kms_key.ssm_kms_key.key_id
      runAsEnabled = true
      runAsDefaultUser = ""
      idleSessionTimeout = "20"
      s3BucketName: aws_s3_bucket.ssm_logs_s3_bucket.bucket
      s3KeyPrefix: ""
      s3EncryptionEnabled: true
      shellProfile = {
        windows = ""
        linux = ""
      }
    }

  })
}

resource "aws_ssm_document" "run" {
  content = local.ssm_document_content
  document_type = "Session"
  name = "SSM-SessionManagerRunShell"
}

