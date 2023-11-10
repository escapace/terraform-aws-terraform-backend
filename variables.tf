variable "terraform_iam_policy_create" {
  description = "Specifies whether to terraform IAM policy is created."
  type        = bool
  default     = true
}

variable "kms_key_description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = "The key used to encrypt the remote state bucket."
}

variable "kms_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  type        = number
  default     = 30
}

variable "kms_key_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = true
}

variable "noncurrent_version_transitions" {
  description = "Specifies when noncurrent object versions transitions. See the aws_s3_bucket document for detail."

  type = list(object({
    days          = number
    storage_class = string
  }))

  default = [
    {
      days          = 7
      storage_class = "GLACIER"
    }
  ]
}

variable "noncurrent_version_expiration" {
  description = "Specifies when noncurrent object versions expire. See the aws_s3_bucket document for detail."

  type = object({
    days = number
  })

  default = null
}

variable "s3_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from S3 buckets so that the buckets can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "s3_logging_target_bucket" {
  description = "The name of the bucket for log storage. The \"S3 log delivery group\" should have Objects-write und ACL-read permissions on the bucket."
  type        = string
  default     = null
}

variable "s3_logging_target_prefix" {
  description = "The prefix to apply on bucket logs, e.g \"logs/\"."
  type        = string
  default     = ""
}

variable "dynamodb_table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  type        = string
  default     = "PAY_PER_REQUEST"
}
