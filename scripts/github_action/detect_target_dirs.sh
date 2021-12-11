#!/bin/bash

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(${GITHUB_WORKSPACE}/scripts/github_action/detect_changed_dirs.sh)
TARGET_DIRS=()

for dir in $CHANGED_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    TARGET_DIRS+=($dir)
  fi
done

echo ${TARGET_DIRS[@]} | jq -cR 'split(" ")'