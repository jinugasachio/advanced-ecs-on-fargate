resource "aws_codebuild_project" "continuous_apply" {
  name         = "continuous-apply"
  service_role = module.continuous_apply_codebuild_role.iam_role_arn

  source {
    type     = "GITHUB" # ビルドするコードがあるリポジトリの種類
    location = "https://github.com/jinugasachio/advanced-ecs-on-fargate.git" # GITHUB or S3の場合は指定する
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    type            = "LINUX_CONTAINER"
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "hashicorp/terraform:1.0.11" # build projectで使用したいdocker image
    privileged_mode = false                        # dockerコンテナを特権モードにするか否か
  }
}

resource "aws_codebuild_source_credential" "example" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = data.aws_ssm_parameter.github_token.value
}

data "aws_ssm_parameter" "github_token" {
  name = "/yukio-ugajin-test/continuous_apply/github_token"
}
