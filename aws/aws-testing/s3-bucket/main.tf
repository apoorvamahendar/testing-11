resource "aws_s3_bucket" "bk_272189" {
  bucket = "bk-272189"

  tags = {
    Name  = "bk-272189"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_272189_public_access_block" {
  bucket = aws_s3_bucket.bk_272189.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_272189_sse" {
  bucket = aws_s3_bucket.bk_272189.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "bk_272189_ownership" {
  bucket = aws_s3_bucket.bk_272189.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "bk_272189_versioning" {
  bucket = aws_s3_bucket.bk_272189.id

  versioning_configuration {
    status = "Suspended"
  }
}