#!/bin/bash

TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd ${GITHUB_WORKSPACE}/$dir
  terraform validate
done
