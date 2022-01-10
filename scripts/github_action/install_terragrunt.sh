#!/bin/bash

BASE_URL=https://github.com/gruntwork-io/terragrunt/releases/download
DOWNLOAD_URL="${BASE_URL}/v${TG_VERSION}/terragrunt_linux_amd64"
wget ${DOWNLOAD_URL} -P /tmp
mv /tmp/terragrunt_linux_amd64 /usr/local/bin/terragrunt
chmod u+x /usr/local/bin/terragrunt
