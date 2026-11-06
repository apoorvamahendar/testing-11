resource "aws_s3_bucket" "bk_36739239" {
  bucket        = "bk-36739239"
  force_destroy = false

  tags = {
    Name  = "bk-36739239"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_36739239_public_access_block" {
  bucket = aws_s3_bucket.bk_36739239.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bk_36739239_versioning" {
  bucket = aws_s3_bucket.bk_36739239.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_36739239_sse" {
  bucket = aws_s3_bucket.bk_36739239.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
