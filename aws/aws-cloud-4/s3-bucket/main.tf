resource "aws_s3_bucket" "bk12989081" {
  bucket        = "bk12989081"
  force_destroy = false

  tags = {
    Name  = "bk12989081"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk12989081_public_access_block" {
  bucket = aws_s3_bucket.bk12989081.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bk12989081_versioning" {
  bucket = aws_s3_bucket.bk12989081.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk12989081_sse" {
  bucket = aws_s3_bucket.bk12989081.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket" "bk26537628" {
  bucket        = "bk26537628"
  force_destroy = false

  tags = {
    Name  = "bk26537628"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk26537628_public_access_block" {
  bucket = aws_s3_bucket.bk26537628.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk26537628_sse" {
  bucket = aws_s3_bucket.bk26537628.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "bk26537628_versioning" {
  bucket = aws_s3_bucket.bk26537628.id

  versioning_configuration {
    status = "Disabled"
  }
}
