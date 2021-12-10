#!/bin/bash

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(git --no-pager diff origin/main..HEAD --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}') # 差分のあるファイルのディレクトリを一意に取得する

for dir in $CHANGED_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -upgrade -input=false
    terraform providers lock -platform=darwin_amd64 -platform=linux_amd64
    tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:$dir plan -- terraform plan
  fi
done
