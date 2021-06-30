#!/bin/bash
# -*- coding: utf-8 -*-

#-----------------------------------------------------------------------
# Script name : shell_project_template/lib/common.sh
# Description :
# Usage:
# Globals :
#   BASE_DIR
#   SCRIPT_NAME
#   LOG_NAME
# Arguments :
# Return :
#-----------------------------------------------------------------------

# Define Variables
BASE_DIR="$(cd $(dirname $0); pwd)"
SCRIPT_NAME="$(basename $0)"
TODAY="$(date +%Y%m%d)"
LOG_NAME="${BASE_DIR}/log/${SCRIPT_NAME%.sh}.log_${TODAY}"

# Define Functions
function pre_proc() {
#-----------------------------------------------------------------------
# Function name : pre_proc
# Description :
# Usage :
# Globals :
#   PS4
# Locals :
#   None
# Arguments :
#   None
# Return :
#-----------------------------------------------------------------------
  # ログ出力フォーマット設定
  export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME:+${FUNCNAME}(): }'

  # 35日以上前のログファイルを削除
  find ${BASE_DIR}/log -type f -name "*.log" -mtime +35 -exec rm '{}' \;

  # post_proc起動設定
  trap 'post_proc $?' EXIT

  # 標準エラー出力をLOG_NAMEに出力する
  exec 2> ${LOG_NAME}

  # 空の変数を禁止し、トレースログを出力する
  set -ux
}

function post_proc() {
#-----------------------------------------------------------------------
# Function name : post_proc
# Description :
# Usage :
# Globals :
#   None
# Locals :
#   _exit_status
#   _error_message
#   _tag
# Arguments :
#   None
# Return :
#-----------------------------------------------------------------------
  local _exit_status
  local _error_message
  local _tag
  _exit_status="$1"
  _error_message=""
  _tag=""

  if (( _exit_status != 0 )); then
    logger -p user.error -t "${_tag}" "${_error_message}"
  fi

  return 0
}


