#!/bin/sh

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(git --no-pager diff origin/main..HEAD --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}') # 差分のあるファイルのディレクトリを一意に取得する

for dir in $CHANGED_DIRS
do
  cd $dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    pwd
    terraform --version
    terraform init -input=false -no-color
    terraform plan -input=false -no-color #| tfnotify --config ${CODEBUILD_SRC_DIR}/tfnotify.yml plan --message "$dir"
  fi
done

# ---------------------------------------------------------------
# -input=false 実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -no-color    カラー出力を抑制し、CodeBuildのログ出力を見やすくする
# --message    通知メッセージに含めたい任意の文字列を指定、
# ---------------------------------------------------------------
