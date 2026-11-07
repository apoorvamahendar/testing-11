# ── bucket-1002399 (retained - do not destroy) ───────────────────────────────

# ── bucket-2171878 (marked force_destroy=true - will be destroyed next pass) ──

# ── bk-123617919 ─────────────────────────────────────────────────────────────

resource "aws_s3_bucket" "bk_123617919" {
  bucket        = "bk-123617919"
  force_destroy = false

  tags = {
    Name  = "bk-123617919"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_123617919_pab" {
  bucket = aws_s3_bucket.bk_123617919.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_123617919_sse" {
  bucket = aws_s3_bucket.bk_123617919.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ── bk-2828981288 ─────────────────────────────────────────────────────────────

resource "aws_s3_bucket" "bk_2828981288" {
  bucket        = "bk-2828981288"
  force_destroy = false

  tags = {
    Name  = "bk-2828981288"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_2828981288_pab" {
  bucket = aws_s3_bucket.bk_2828981288.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_2828981288_sse" {
  bucket = aws_s3_bucket.bk_2828981288.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}