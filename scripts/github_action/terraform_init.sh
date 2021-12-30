#!/bin/bash

CONFIG_FILE="terraform.tf"
TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then
    terraform init -input=false -no-color
  fi
done
