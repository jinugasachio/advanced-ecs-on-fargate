#!/bin/bash

set -euo pipefail

TF_DIRS=$@
echo $TF_DIRS | xargs -r -n 1 bash -c 'cd ${GITHUB_WORKSPACE}/${0} && terragrunt providers lock -platform=darwin_amd64 -platform=linux_amd64 --terragrunt-non-interactive'
