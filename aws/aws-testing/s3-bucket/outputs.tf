output "bucket_id" {
  description = "The name/ID of the S3 bucket."
  value       = aws_s3_bucket.bk_272189.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.bk_272189.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name."
  value       = aws_s3_bucket.bk_272189.bucket_domain_name
}