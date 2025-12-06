terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
   profile = "terraform_dev"
}
provider "tls" {}

# Local Provider (محتاجه عشان local_file في key_pair module)
provider "local" {}