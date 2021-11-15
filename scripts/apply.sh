#!/bin/sh

terraform init -input=false -no-color
terraform apply -input=false -no-color -auto-approve

# ---------------------------------------------------------------
# -input=false  実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -no-color     カラー出力を抑制し、CodeBuildのログ出力を見やすくする
# -auto-approve apply時の最終確認を省く
# ---------------------------------------------------------------