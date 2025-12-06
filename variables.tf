variable "aws_region" {
  default = "us-east-1"
}

variable "alert_email" {
  description = "Email to receive CPU alerts"
  type        = string
}
