# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  required_version = "1.3.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }

  backend "s3" {}
}
