resource "aws_kms_key" "ssm_kms_key" {
  description         = "KMS Key for encrypting Session Manager logs"
  policy              = data.aws_iam_policy_document.ssm_kms_key_iam_policy.json
  enable_key_rotation = true
}


data "aws_iam_policy_document" "ssm_kms_key_iam_policy" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
      type = "AWS"
    }
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
  }


  // https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html
  // https://aws.amazon.com/premiumsupport/knowledge-center/s3-bucket-access-default-encryption/

  statement {
    sid = "Allow use of the key for CloudWatch to encrypt logs"
    principals {
      identifiers = [
        "logs.${data.aws_region.current.name}.amazonaws.com"
      ]
      type = "Service"
    }
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]
    resources = [
      "*"
    ]
    condition {
      test   = "ArnEquals"
      values = [
        "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:${var.cloudwatch_log_group_ssm_logs}"
      ]
      variable = "kms:EncryptionContext:aws:logs:arn"
    }
  }


  // S3 Bucket KMS permissions is specified in the instance profile IAM Policy

  statement {
    sid = "Allow use of the key for S3 to encrypt logs"
    principals {
      identifiers = var.aws_principals
      type        = "AWS"
    }
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]
    resources = [
      "*"
    ]
    condition {
      test   = "StringLike"
      values = [
        "arn:aws:s3:::${var.s3_bucket_ssm_logs}/*"
      ]
      variable = "kms:EncryptionContext:aws:s3:arn"
    }
  }
}

