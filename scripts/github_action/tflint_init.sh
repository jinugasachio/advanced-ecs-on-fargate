#!/bin/bash

set -euo pipefail

tflint --init --config $GITHUB_WORKSPACE/.tflint.hcl
