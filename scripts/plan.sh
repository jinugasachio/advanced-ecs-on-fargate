#!/bin/sh

terraform init -input=false -no-color
terraform plan -input=false -no-color | \
tfnotify --config ${CODEBUILD_SRC_DIR}/tfnotify.yml plan # --message "$(date)"

# ---------------------------------------------------------------
# -input=false 実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -no-color    カラー出力を抑制し、CodeBuildのログ出力を見やすくする
# --message    通知メッセージに含めたい任意の文字列を指定、
# ---------------------------------------------------------------