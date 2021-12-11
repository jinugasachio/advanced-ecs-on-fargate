terraform {
  required_version = "1.0.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}