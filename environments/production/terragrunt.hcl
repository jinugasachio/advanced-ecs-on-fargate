remote_state {
  backend = "s3"
  config = {
    bucket  = "ugajin-yukio"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-west-1"
    encrypt = true
  }
}

// バケットは環境毎に分けた方が良さそう（＝アカウントが分かれらば自然に別れることになるが）
