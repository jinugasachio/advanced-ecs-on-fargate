#!/bin/bash

CONFIG_FILE="provider.tf"
CHANGED_DIRS=`./scripts/github_action/detect_changed_dirs.sh`
TARGET_DIRS=()

echo ${CHANGED_DIRS[@]}

for dir in $CHANGED_DIRS
do
  cd ./$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    TARGET_DIRS+=($dir)
  fi
done

echo ${TARGET_DIRS[@]}