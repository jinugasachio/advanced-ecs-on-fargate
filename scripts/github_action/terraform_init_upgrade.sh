#!/bin/bash

CONFIG_FILE="provider.tf"
TARGET_DIRS=$@

# TODO シェルスクリプトに配列（dirs）と文字列（-upgrade）の複数の引数を渡すことができれば、共通化できる
for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -upgrade -input=false
  fi
done
