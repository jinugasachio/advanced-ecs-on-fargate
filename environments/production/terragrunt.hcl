generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "1.1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }

  backend "s3" {}
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      Environments = "production"
      Terraform    = "true"
    }
  }
}
EOF
}

// バケットは環境毎に分けた方が良さそう（＝アカウントが分かれらば自然に別れることになるが）
remote_state {
  backend = "s3"
  config = {
    bucket  = "ugajin-yukio"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-west-1"
    encrypt = true
  }
}