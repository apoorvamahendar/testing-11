# ============================================================
# SIBLING BUCKET - bk26537628 (PRESERVED, UNTOUCHED)
# ============================================================

resource "aws_s3_bucket" "bk26537628" {
  bucket        = "bk26537628"
  force_destroy = false

  tags = {
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
    status = "Enabled"
  }
}

# ============================================================
# bk12989081 AND ITS THREE CONFIGURATION RESOURCES ARE
# INTENTIONALLY ABSENT FROM THIS FILE.
#
# When this stack is applied, OpenTofu will detect that
# aws_s3_bucket.bk12989081,
# aws_s3_bucket_public_access_block.bk12989081_public_access_block,
# aws_s3_bucket_server_side_encryption_configuration.bk12989081_sse, and
# aws_s3_bucket_versioning.bk12989081_versioning
# are present in state but absent from configuration, and will
# plan their destruction in dependency order (sub-resources first,
# bucket last).
#
# IMPORTANT - TWO-STEP PROCESS:
#   Step 1: Before removing these blocks, run:
#             tofu apply   (with force_destroy=true already set on bk12989081)
#           to persist force_destroy=true into state so the bucket can be
#           auto-emptied during destroy even if it contains objects.
#   Step 2: Apply THIS file - OpenTofu will destroy the four resources
#           cleanly, emptying all objects/versions/delete-markers first.
# ============================================================