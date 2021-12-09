#!/bin/sh

BASE_URL=https://github.com/suzuki-shunsuke/tfcmt/releases/download
DOWNLOAD_URL="${BASE_URL}/v2.1.0/tfcmt_linux_amd64.tar.gz"
wget ${DOWNLOAD_URL} -P /tmp
tar zxvf /tmp/tfcmt_linux_amd64.tar.gz -C /tmp
mv /tmp/tfcmt /usr/local/bin/tfcmt
