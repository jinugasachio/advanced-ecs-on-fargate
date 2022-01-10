#!/bin/bash

# 特定のディレクトリ内の差分のあるファイルのディレクトリを一意に取得する
RELATIVE_DIR=$1
git --no-pager diff origin/main..HEAD --name-only --relative=$RELATIVE_DIR | xargs -I{} dirname {} | awk '!a[$0]++{print}'
