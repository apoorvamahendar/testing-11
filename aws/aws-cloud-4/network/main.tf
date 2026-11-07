# ── VPC ──────────────────────────────────────────────────────────────────────
resource "aws_vpc" "vpc_234567898" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-234567898"
  }
}

# ── Public Subnet ─────────────────────────────────────────────────────────────
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_234567898.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# ── Security Group ────────────────────────────────────────────────────────────
resource "aws_security_group" "web_ssh_sg" {
  name        = "web-ssh-sg"
  description = "Allow HTTP, HTTPS, and SSH inbound traffic"
  vpc_id      = aws_vpc.vpc_234567898.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
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
    Name = "web-ssh-sg"
  }
}

# ── Internet Gateway ──────────────────────────────────────────────────────────
resource "aws_internet_gateway" "web_ec2_igw" {
  vpc_id = aws_vpc.vpc_234567898.id

  tags = {
    Name  = "web-ec2-igw"
    Stack = "network"
  }
}

# ── Route Table ───────────────────────────────────────────────────────────────
resource "aws_route_table" "web_ec2_public_rt" {
  vpc_id = aws_vpc.vpc_234567898.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_ec2_igw.id
  }

  tags = {
    Name  = "web-ec2-public-rt"
    Stack = "network"
  }
}

# ── Route Table Association ───────────────────────────────────────────────────
resource "aws_route_table_association" "web_ec2_public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.web_ec2_public_rt.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_234567898.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_234567898.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
