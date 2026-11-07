# ── bucket-1002399 (retained - do not destroy) ───────────────────────────────

resource "aws_s3_bucket" "bucket_1002399" {
  bucket        = "bucket-1002399"
  force_destroy = false

  tags = {
    ManagedBy = "cloud-agentra"
    Stack     = "s3-bucket"
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
    status = "Enabled"
  }
}

# ── bucket-2171878 (marked force_destroy=true - will be destroyed next pass) ──

resource "aws_s3_bucket" "bucket_2171878" {
  bucket        = "bucket-2171878"
  force_destroy = true

  tags = {
    ManagedBy = "cloud-agentra"
    Stack     = "s3-bucket"
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
    status = "Enabled"
  }
}