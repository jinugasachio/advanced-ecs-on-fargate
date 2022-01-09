terraform {
  required_version = "1.1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }
  backend "s3" {
    bucket = "yukio-ugajin"
    key    = "advanced_ecs_on_fargate.production.network" # freeeサンドボックス環境で管理なので注意
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}
