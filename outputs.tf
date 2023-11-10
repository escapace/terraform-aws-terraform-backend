output "kms_key" {
  description = "The KMS customer master key to encrypt state buckets."
  value       = aws_kms_key.this
}

output "kms_key_alias" {
  description = "The alias of the KMS customer master key used to encrypt state bucket and dynamodb."
  value       = aws_kms_alias.this
}

output "s3_bucket" {
  description = "The S3 bucket to store the remote state file."
  value       = aws_s3_bucket.state
}

output "dynamodb_table" {
  description = "The DynamoDB table to manage lock states."
  value       = aws_dynamodb_table.lock
}

output "iam_policy" {
  description = "The IAM Policy to access remote state environment."
  value       = var.terraform_iam_policy_create ? aws_iam_policy.terraform[0] : null
}

output "configuration" {
  description = "Terraform S3 backend configuration."
  value = {
    bucket         = aws_s3_bucket.state.id
    region         = aws_s3_bucket.state.region
    encrypt        = true
    kms_key_id     = aws_kms_key.this.id
    dynamodb_table = aws_dynamodb_table.lock.id
  }
}
