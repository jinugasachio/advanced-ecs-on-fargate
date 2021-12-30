terraform {
  backend "s3" {
    bucket = "yukio-ugajin"
    key    = "advanced_ecs_on_fargate.production.codebuild" # freeeサンドボックス環境で管理なので注意
    region = "us-west-1"
  }
}