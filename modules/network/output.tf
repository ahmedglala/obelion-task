output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet for EC2 instances"
  value       = aws_subnet.public.id
}

output "private_subnet_ids" {
  description = "List of 2 private subnets for RDS (covers 2 AZs)"
  value       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

output "availability_zone" {
  value = var.availability_zone
}