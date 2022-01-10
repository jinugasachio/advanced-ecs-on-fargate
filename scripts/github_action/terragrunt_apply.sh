#!/bin/bash

set -euo pipefail

CHANGED_DIRS=$@
echo $CHANGED_DIRS | xargs -r -n 1 bash -c 'cd ${GITHUB_WORKSPACE}/${0} && tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml -var target:${0} apply -- terragrunt apply'
