# Look up the existing EC2 instance deployed by the compute stack
data "aws_instance" "web_instance" {
  filter {
    name   = "tag:Name"
    values = ["vpc-234567898-ec2"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running", "stopped"]
  }
}

# Look up the existing Internet Gateway deployed by the network stack
data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = ["vpc-234567898-igw"]
  }
}

# Elastic IP associated to the existing EC2 instance (original)
resource "aws_eip" "web_eip" {
  instance = data.aws_instance.web_instance.id

  depends_on = [data.aws_internet_gateway.igw]

  tags = {
    Name  = "vpc-234567898-eip"
    Stack = "networking"
  }
}

# Look up the new EC2 instance deployed by the compute stack (web-ec2-instance)
data "aws_instance" "web_ec2_instance" {
  filter {
    name   = "tag:Name"
    values = ["web-ec2-instance"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running", "stopped"]
  }
}

# Look up the new Internet Gateway deployed by the network stack (web-ec2-igw)
data "aws_internet_gateway" "web_ec2_igw" {
  filter {
    name   = "tag:Name"
    values = ["web-ec2-igw"]
  }
}

# Elastic IP for web-ec2-instance
resource "aws_eip" "web_ec2_eip" {
  domain   = "vpc"
  instance = data.aws_instance.web_ec2_instance.id

  depends_on = [data.aws_internet_gateway.web_ec2_igw]

  tags = {
    Name  = "web-ec2-eip"
    Stack = "networking"
  }
}