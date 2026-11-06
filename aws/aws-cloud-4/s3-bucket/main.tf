resource "aws_s3_bucket_versioning" "bk26537628_versioning" {
  bucket = "bk26537628"

  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk26537628_sse" {
  bucket = "bk26537628"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [aws_s3_bucket_versioning.bk26537628_versioning]
}

resource "aws_s3_bucket_public_access_block" "bk26537628_public_access_block" {
  bucket = "bk26537628"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_server_side_encryption_configuration.bk26537628_sse]
}

resource "aws_s3_bucket" "bk26537628" {
  bucket        = "bk26537628"
  force_destroy = true

  tags = {
    Name      = "bk26537628"
    ManagedBy = "cloud-agentra"
  }

  depends_on = [aws_s3_bucket_public_access_block.bk26537628_public_access_block]
}