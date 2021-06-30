#!/bin/bash
# -*- coding: utf-8 -*-

#-----------------------------------------------------------------------
# Script name : shell_project_template/main.sh
# Description :
# Usage:
# Globals :
#   None
# Arguments :
# Exit status :
#   0 on success, non-zero on error.
#-----------------------------------------------------------------------

# Define Variables

# Define Functions
function main() {
#-----------------------------------------------------------------------
# Function name : main
# Description :
# Usage :
# Globals :
#   None
# Locals :
#   None
# Arguments :
#   None
# Return :
#   0 on success, no-zero on error.
#-----------------------------------------------------------------------
  echo "test"
  return 0
}

# Main processing
cd "$(cd "$(dirname $0)"; pwd)"
source ./lib/common.sh

pre_proc

main || exit 1

exit 0

