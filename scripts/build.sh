#!/bin/sh
set -x

if [[ ${CODEBUILD_WEBHOOK_TRIGGER} = 'branch/main' ]]; then
  ${CODEBUILD_SRC_DIR}/scripts/apply.sh
else
  ${CODEBUILD_SRC_DIR}/scripts/plan.sh
fi

# ---------------------------------------------------------------
# CODEBUILD_WEBHOOK_TRIGGER は Codebuildが自動で定義するもの
# trigger の種類により値が変わる。プルリクエスト時は pr/プルリクエスト番号
# main ブランチへの push は branch/main
#---------------------------------------------------------------