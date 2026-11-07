# ──────────────────────────────────────────────
# Bucket 1: bk-29991901
# ──────────────────────────────────────────────
# ──────────────────────────────────────────────
# Bucket 2: bk-29101029876
# ──────────────────────────────────────────────
resource "aws_s3_bucket" "bk_29101029876" {
  bucket        = "bk-29101029876"
  force_destroy = true

  tags = {
    Name  = "bk-29101029876"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "bk_29101029876_public_access_block" {
  bucket = aws_s3_bucket.bk_29101029876.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk_29101029876_sse" {
  bucket = aws_s3_bucket.bk_29101029876.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "bk_29101029876_versioning" {
  bucket = aws_s3_bucket.bk_29101029876.id

  versioning_configuration {
    status = "Disabled"
  }
}

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

# ──────────────────────────────────────────────
# Internet Gateway
# ──────────────────────────────────────────────
resource "aws_internet_gateway" "igw" {
  vpc_id = "vpc-08e19a4dac5d16c9c"

  tags = {
    Name  = "vpc-234567898-igw"
    Stack = "s3-bucket"
  }
}

# ──────────────────────────────────────────────
# Public Route Table
# ──────────────────────────────────────────────
resource "aws_route_table" "public_rt" {
  vpc_id = "vpc-08e19a4dac5d16c9c"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name  = "vpc-234567898-public-rt"
    Stack = "s3-bucket"
  }
}

# ──────────────────────────────────────────────
# Route Table Association - public subnet
# ──────────────────────────────────────────────
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = "subnet-0c1a74c9eff35cc04"
  route_table_id = aws_route_table.public_rt.id
}