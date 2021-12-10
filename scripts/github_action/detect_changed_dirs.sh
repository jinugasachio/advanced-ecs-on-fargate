#!/bin/bash
git --no-pager diff origin/main..HEAD --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}' # 差分のあるファイルのディレクトリを一意に取得する