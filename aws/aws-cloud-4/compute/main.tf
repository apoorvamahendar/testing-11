# ---------------------------------------------------------------------------
# Data sources - look up already-deployed network resources by name
# ---------------------------------------------------------------------------

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["vpc-234567898-public-subnet"]
  }
}

data "aws_security_group" "web_ssh_sg" {
  filter {
    name   = "group-name"
    values = ["vpc-234567898-web-ssh-sg"]
  }
}

# ---------------------------------------------------------------------------
# Resolve the latest Ubuntu 22.04 LTS AMI in ap-south-1 (Canonical)
# ---------------------------------------------------------------------------

data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# ---------------------------------------------------------------------------
# TLS key pair - 4096-bit RSA
# ---------------------------------------------------------------------------

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ---------------------------------------------------------------------------
# AWS Key Pair - registers the public key with AWS
# ---------------------------------------------------------------------------

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "vpc-234567898-keypair"
  public_key = tls_private_key.ec2_key.public_key_openssh

  tags = {
    Name  = "vpc-234567898-keypair"
    Stack = "compute"
  }
}

# ---------------------------------------------------------------------------
# Write private key to disk (.pem file, chmod 600)
# ---------------------------------------------------------------------------

resource "local_sensitive_file" "private_key_file" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "${path.module}/ec2-private-key.pem"
  file_permission = "0600"
}

# ---------------------------------------------------------------------------
# EC2 instance - t2.micro, Ubuntu 22.04 LTS, public subnet
# ---------------------------------------------------------------------------

resource "aws_instance" "web_instance" {
  ami                    = data.aws_ami.ubuntu_2204.id
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.web_ssh_sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name

  tags = {
    Name  = "vpc-234567898-ec2"
    Stack = "compute"
  }
}