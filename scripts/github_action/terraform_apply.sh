#!/bin/bash

CONFIG_FILE="provider.tf"
TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:$dir apply -- terraform apply -no-color -auto-approve
  fi
done

# ---------------------------------------------------------------------------------
# -input=false  実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -auto-approve apply時の最終確認を省く
# ---------------------------------------------------------------------------------
