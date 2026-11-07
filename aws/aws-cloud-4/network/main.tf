# ── VPC ──────────────────────────────────────────────────────────────────────
resource "aws_vpc" "vpc_234567898" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name  = "vpc-234567898"
    Stack = "network"
  }
}

# ── Public Subnet ─────────────────────────────────────────────────────────────
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_234567898.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name  = "vpc-234567898-public-subnet"
    Stack = "network"
  }
}

# ── Internet Gateway ──────────────────────────────────────────────────────────
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_234567898.id

  tags = {
    Name  = "vpc-234567898-igw"
    Stack = "network"
  }
}

# ── Route Table ───────────────────────────────────────────────────────────────
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_234567898.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name  = "vpc-234567898-public-rt"
    Stack = "network"
  }
}

# ── Route Table Association ───────────────────────────────────────────────────
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ── Security Group ────────────────────────────────────────────────────────────
resource "aws_security_group" "web_ssh_sg" {
  name        = "vpc-234567898-web-ssh-sg"
  description = "Allow inbound HTTP (80) and SSH (22); unrestricted egress"
  vpc_id      = aws_vpc.vpc_234567898.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "vpc-234567898-web-ssh-sg"
    Stack = "network"
  }
}