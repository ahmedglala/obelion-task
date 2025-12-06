variable "vpc_id" {
  description = "VPC ID from network module"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for SG names"
  type        = string
  default     = "jobtask"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH (change to your IP in real project)"
  type        = string
  default     = "0.0.0.0/0"          # للـ demo بس، غيّره لـ IP بتاعك لما تخلّص
}