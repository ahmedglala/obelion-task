output "key_name" {
  description = "Name of the key pair to use in EC2"
  value       = aws_key_pair.this.key_name
}

output "private_key_path" {
  description = "Path to the generated private key file"
  value       = local_file.private_key.filename
}