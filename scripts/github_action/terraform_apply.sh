#!/bin/sh

CONFIG_FILE="provider.tf"
CHANGED_DIRS=$(git --no-pager diff HEAD..HEAD^ --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}') # 差分のあるファイルのディレクトリを一意に取得する

for dir in $CHANGED_DIRS
do
  cd ${CODEBUILD_SRC_DIR}/$dir
  if [ -e ${CONFIG_FILE} ]; then # provider.tfが存在するならば
    terraform init -input=false
    tfcmt --config ${GITHUB_WORKSPACE}/tfcmt.yaml apply -- terraform apply -auto-approve
  fi
done

# ---------------------------------------------------------------------------------
# -input=false  実行時の入力を抑制し、未定義の変数がある場合はエラーにする
# -no-color     カラー出力を抑制し、ログ出力を見やすくする
# -auto-approve apply時の最終確認を省く
# --message    通知メッセージに含めたい任意の文字列を指定、
# ---------------------------------------------------------------------------------
