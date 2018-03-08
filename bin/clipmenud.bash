#!/usr/bin/env bash

cache_dir=/tmp/clipmenu.$USER/
mkdir -p -m0700 "$cache_dir"

declare -A last_data

if type -p xsel >/dev/null; then
  clipmenucmd="xsel -o --"
else
  clipmenucmd="xclip -o -sel "
fi
while sleep "${CLIPMENUD_SLEEP:-1}"; do
  for selection in clipboard primary; do
    data="$(${clipmenucmd}${selection}; printf x)"

    # We add and remove the x so that trailing newlines are not stripped.
    # Otherwise, they would be stripped by the very nature of how POSIX
    # defines command substitution.
    data="${data%x}"

    [[ "$data" == *[^[:blank:]]* ]] || continue

    [[ "${last_data[$selection]}" == "$data" ]] && continue
    last_data["$selection"]="$data"

    md5="$(sha1sum <<< ${data})"
    md5="${md5%% *}"

    printf '%s' "$data" > "${cache_dir}/${md5}"
  done &> /dev/null
done
