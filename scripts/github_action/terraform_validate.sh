#!/bin/bash

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'terraform validate ${GITHUB_WORKSPACE}/${0}'
