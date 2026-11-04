resource "aws_s3_bucket" "bk_920910" {
  bucket        = "bk-920910"
  force_destroy = false

  tags = {
    Name  = "bk-920910"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_920910_public_access_block" {
  bucket = aws_s3_bucket.bk_920910.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bk_920910_versioning" {
  bucket = aws_s3_bucket.bk_920910.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_920910_encryption" {
  bucket = aws_s3_bucket.bk_920910.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}