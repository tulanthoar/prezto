#!/bin/env sh
[[ -z $1 ]] && export CLIPMENUD_SLEEP=2 || export CLIPMENUD_SLEEP="$1"
ps -a --user "$USER" | grep -E "\<clipmenud$" || clipmenud &> /dev/null
# ps aux | grep -E "/bin/clipmenud$" || clipmenud 2> /dev/null
