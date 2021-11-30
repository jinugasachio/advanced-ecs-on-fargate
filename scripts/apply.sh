#!/bin/sh

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(git --no-pager diff HEAD..HEAD^ --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}') # 差分のあるファイルのディレクトリを一意に取得する
MESSAGE=$(git log ${CODEBUILD_SOURCE_VERSION} -1 --pretty=format:"%s")
CODEBUILD_SOURCE_VERSION=$(echo ${MESSAGE} | cut -f4 -d' ' | sed 's/#/pr\//')

for dir in $CHANGED_DIRS
do
  cd ${CODEBUILD_SRC_DIR}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -input=false -no-color
    terraform apply -input=false -no-color -auto-approve | \
    tfnotify --config ${CODEBUILD_SRC_DIR}/tfnotify.yaml apply --message "$dir"
  fi
done

# ---------------------------------------------------------------------------------
# -input=false  実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -no-color     カラー出力を抑制し、CodeBuildのログ出力を見やすくする
# -auto-approve apply時の最終確認を省く
# --message    通知メッセージに含めたい任意の文字列を指定、
#
# tfnotifyはCODEBUILD_SOURCE_VERSIONにpr/123のような文字列が設定されている
# 前提で動く。しかしmainへのpush時にはコミットハッシュが設定されている。
# そこで3~4行目では直前のコミットメッセージからpr番号を取得しpr/123のような文字列で上書きしている。
#
# ※ ただこれはv0.3.1の時の挙動なので最新でも同じ挙動なのかは後で要確認！！！
# ---------------------------------------------------------------------------------