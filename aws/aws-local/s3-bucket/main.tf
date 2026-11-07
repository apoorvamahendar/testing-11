# ──────────────────────────────────────────────
# Bucket 1: bucket-1002399
# ──────────────────────────────────────────────
resource "aws_s3_bucket" "bucket_1002399" {
  bucket        = "bucket-1002399"
  force_destroy = true

  tags = {
    Name  = "bucket-1002399"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_1002399_pab" {
  bucket = aws_s3_bucket.bucket_1002399.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_1002399_sse" {
  bucket = aws_s3_bucket.bucket_1002399.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_1002399_versioning" {
  bucket = aws_s3_bucket.bucket_1002399.id

  versioning_configuration {
    status = "Disabled"
  }
}

# ──────────────────────────────────────────────
# Bucket 2: bucket-2171878
# ──────────────────────────────────────────────
resource "aws_s3_bucket" "bucket_2171878" {
  bucket        = "bucket-2171878"
  force_destroy = true

  tags = {
    Name  = "bucket-2171878"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_2171878_pab" {
  bucket = aws_s3_bucket.bucket_2171878.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_2171878_sse" {
  bucket = aws_s3_bucket.bucket_2171878.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_2171878_versioning" {
  bucket = aws_s3_bucket.bucket_2171878.id

  versioning_configuration {
    status = "Disabled"
  }
}

# ──────────────────────────────────────────────
# Outputs
# ──────────────────────────────────────────────
output "bucket_1002399_id" {
  description = "The name (ID) of bucket-1002399"
  value       = aws_s3_bucket.bucket_1002399.id
}

output "bucket_1002399_arn" {
  description = "The ARN of bucket-1002399"
  value       = aws_s3_bucket.bucket_1002399.arn
}

output "bucket_2171878_id" {
  description = "The name (ID) of bucket-2171878"
  value       = aws_s3_bucket.bucket_2171878.id
}

output "bucket_2171878_arn" {
  description = "The ARN of bucket-2171878"
  value       = aws_s3_bucket.bucket_2171878.arn
}