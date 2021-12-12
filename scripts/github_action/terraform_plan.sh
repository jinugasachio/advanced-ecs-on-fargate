#!/bin/bash

CONFIG_FILE="provider.tf"
TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -input=false
    terraform validate
    tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:$dir plan -- terraform plan
  fi
done
