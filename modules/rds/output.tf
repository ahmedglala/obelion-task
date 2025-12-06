output "rds_endpoint" {
  description = "RDS endpoint (host:port)"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_address" {
  description = "RDS hostname only"
  value       = aws_db_instance.mysql.address
}

output "db_name" {
  value = aws_db_instance.mysql.db_name
}

output "db_username" {
  value = aws_db_instance.mysql.username
}