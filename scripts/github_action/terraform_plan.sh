#!/bin/bash

set -euo pipefail

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd ${GITHUB_WORKSPACE}/${0} && tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:${0} plan -- terragrunt plan'
