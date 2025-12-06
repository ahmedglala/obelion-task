variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet (EC2 machines)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet (RDS only)"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Single AZ as required by the task"
  type        = string
  default     = "us-east-1a"
}

variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "jobtask"
}