output "subnet_public_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "route_table_public_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public_rt.id
}

output "bk_123617919_id" {
  description = "ID (name) of the S3 bucket bk-123617919"
  value       = aws_s3_bucket.bk_123617919.id
}

output "bk_123617919_arn" {
  description = "ARN of the S3 bucket bk-123617919"
  value       = aws_s3_bucket.bk_123617919.arn
}

output "main_vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main_vpc.id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "web_ssh_sg_id" {
  description = "ID of the web/SSH security group"
  value       = aws_security_group.web_ssh_sg.id
}