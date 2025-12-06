variable "frontend_instance_id" {
  description = "Frontend EC2 instance ID"
  type        = string
}

variable "backend_instance_id" {
  description = "Backend EC2 instance ID"
  type        = string
}

variable "alert_email" {
  description = "Email to receive alerts"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "jobtask"
}