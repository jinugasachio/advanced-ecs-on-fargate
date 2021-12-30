#!/bin/bash

CONFIG_FILE="terraform.tf"
TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then
    terraform providers lock -platform=darwin_amd64 -platform=linux_amd64
  fi
done
