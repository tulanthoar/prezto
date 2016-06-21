#!/bin/env dash
[[ -z $1 ]] && export CLIPMENUD_SLEEP=2 || export CLIPMENUD_SLEEP="$1"
ps -a --user "$USER" | grep -E "\<clipmenud$" || clipmenud &> /dev/null
