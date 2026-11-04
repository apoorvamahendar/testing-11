resource "aws_s3_bucket" "bk_2873988291" {
  bucket        = "bk-2873988291"
  force_destroy = true

  tags = {
    Name  = "bk-2873988291"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_2873988291_public_access_block" {
  bucket = aws_s3_bucket.bk_2873988291.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bk_2873988291_versioning" {
  bucket = aws_s3_bucket.bk_2873988291.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_2873988291_sse" {
  bucket = aws_s3_bucket.bk_2873988291.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}