#!/bin/bash

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd ${GITHUB_WORKSPACE}/${0} && tflint --init'