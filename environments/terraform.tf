terraform {
  required_version = "1.3.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.66.0"
    }
  }

  backend "s3" {}
}
