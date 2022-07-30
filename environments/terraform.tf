terraform {
  required_version = "1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
  }

  backend "s3" {}
}
