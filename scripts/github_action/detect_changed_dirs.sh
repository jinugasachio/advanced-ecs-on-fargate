#!/bin/bash

# 指定ディレクトリ内の差分のあるファイルのディレクトリを一意に取得する
SPECIFIED_DIR=$1
git --no-pager diff origin/main..HEAD --name-only $SPECIFIED_DIR | xargs -I{} dirname {} | awk '!a[$0]++{print}'
