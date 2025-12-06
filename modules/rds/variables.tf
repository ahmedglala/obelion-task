
variable "private_subnet_ids" {
  description = "List of private subnet IDs (must cover at least 2 AZs)"
  type        = list(string)
}
variable "rds_sg_id"         { type = string }
variable "vpc_id"            { type = string }

variable "name_prefix" {
  type    = string
  default = "jobtask"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
  default   = "admin123"   # غيّرها من terraform.tfvars
}