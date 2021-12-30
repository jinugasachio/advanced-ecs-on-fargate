module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  version                      = "3.11.0"
  name                         = "yukio-ugajin-vpc"
  cidr                         = "10.0.0.0/16"
  create_igw                   = true
  create_database_subnet_group = true

  azs              = ["us-west-1b", "us-west-1c"]
  public_subnets   = ["10.0.0.0/24", "10.0.1.0/24", "10.0.240.0/24", "10.0.241.0/24"]
  private_subnets  = ["10.0.8.0/24", "10.0.9.0/24"]
  database_subnets = ["10.0.16.0/24", "10.0.17.0/24"]

  tags = {
    Terraform = "true"
  }
}
