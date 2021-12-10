#!/bin/bash

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(git --no-pager diff origin/main..HEAD --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}') # 差分のあるファイルのディレクトリを一意に取得する

for dir in $CHANGED_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -input=false
    tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:$dir plan -- terraform plan
  fi
done

# ---------------------------------------------------------------
# -input=false 実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# ---------------------------------------------------------------
