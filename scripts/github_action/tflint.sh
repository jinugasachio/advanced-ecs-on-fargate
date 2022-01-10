#!/bin/bash

set -euo pipefail

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd ${0} && tflint --config ${GITHUB_WORKSPACE}/.tflint.hcl --format compact'