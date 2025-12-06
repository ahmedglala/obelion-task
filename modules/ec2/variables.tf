variable "public_subnet_id" { type = string }
variable "ec2_sg_id"        { type = string }
variable "key_name"         { type = string }
variable "name_prefix" {
  type    = string
  default = "jobtask"
}