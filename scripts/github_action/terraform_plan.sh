#!/bin/bash

dir=$(pwd)
dir=${dir##$GITHUB_WORKSPACE/environments/}
tfcmt --config $GITHUB_WORKSPACE/tfcmt.yaml -var target:$dir plan -- terraform plan \
  && terraform --version # terragruntの仕様故に最後にversionを出力する必要がある。https://github.com/gruntwork-io/terragrunt/blob/f33fe8c6e1941e79ef99b93b01bbb23f80531a71/cli/version_check.go#L94 
