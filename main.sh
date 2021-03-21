#!/bin/bash
# -*- coding: utf-8 -*-

#
# Script Name :
# Description :
# Usage       :
#

#
# Define Variables
#
readonly BASE_DIR="$(cd $(dirname ${0}); pwd)"
readonly SCRIPT_NAME="$(basename ${0})"
readonly LOG_FILE="${BASE_DIR}/log/${SCRIPT_NAME%.sh}.log"

#
# Define Functions
#
function pre_proc() {
#
# Description :
# Usage       :
#
  # 外部ファイル読み込み
  cd ${BASE_DIR}
  source lib/*

  # ログ出力フォーマット設定
  export PS4="+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME:+${FUNCNAME}(): }"

  # post_proc起動設定
  trap 'post_proc ${?}' EXIT

  # 標準エラー出力を${LOG_FILE}に出力する
  exec 2> ${LOG_FILE}

  # 空の変数を禁止し、トレースログを出力する
  set -ux
}

function post_proc() {
#
# Description :
# Usage       :
#
  local exit_status=${1}
  local error_message=""
  local tag=""

  if (( exit_status != 0 )); then
    logger -p user.err -t ${tag} "${error_message}"
    cat ${LOG_DIR}/${LOG_FILE}
  fi

  return 0
}

function main() {
  return 0
}

#
# Main
#
pre_proc

main || exit 1

exit 0

