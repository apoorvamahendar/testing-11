output "bk_29101029876_id" {
  description = "ID of S3 bucket bk-29101029876"
  value       = aws_s3_bucket.bk_29101029876.id
}

output "bk_36739239_id" {
  description = "ID of S3 bucket bk-36739239"
  value       = aws_s3_bucket.bk_36739239.id
}

output "igw_id" {
  description = "ID of the Internet Gateway attached to vpc-08e19a4dac5d16c9c"
  value       = aws_internet_gateway.igw.id
}

output "public_rt_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public_rt.id
}

output "public_rt_assoc_id" {
  description = "ID of the route table association for the public subnet"
  value       = aws_route_table_association.public_rt_assoc.id
}