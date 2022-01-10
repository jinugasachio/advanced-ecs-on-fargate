generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("../terraform.tf")
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("../provider.tf")
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