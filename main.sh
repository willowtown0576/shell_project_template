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
readonly LOG_DIR="${BASE_DIR}/log"
readonly LOG_NAME="${SCRIPT_NAME%.sh}.log"

#
# Define Functions
#
function pre_proc() {
#
# Description
# Usage
#
  cd ${BASE_DIR}
  source lib/*

  export PS4=""

  trap 'post_proc ${?}' EXIT

  exec 2> ${LOG_DIR}/${LOG_NAME}
  return 0
}

function post_proc() {
#
# Description
# Usage
#


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

