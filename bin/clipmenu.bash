#!/usr/bin/env bash

shopt -s nullglob

# We use this to make sure the cache files are sorted bytewise
LC_COLLATE=C

# Some people copy/paste huge swathes of text that could slow down dmenu
line_length_limit=500

declare -A selections
ordered_selections=()

# We can't use `for ... in` here because we need to add files to
# ordered_selections from last to first -- that is, newest to oldest. Incoming
# clipboard entries have a ISO datetime prefixed to the front to aid in this.
for fileh in $(ls -1c /tmp/clipmenu.$USER|head -n50); do
    file="/tmp/clipmenu.${USER}/${fileh}"
    # We look for the first line matching regex /./ here because we want the
    # first line that can provide reasonable context to the user. That is, if
    # you have 5 leading lines of whitespace, displaying " (6 lines)" is much
    # less useful than displaying "foo (6 lines)", where "foo" is the first
    # line in the entry with actionable context.
    first_line=$(sed -n '/./{p;q}' "$file" | cut -c1-"$line_length_limit")
    lines=$(wc -l < "$file")

    # if (( lines > 1 )); then
        first_line+=" ($lines lines)"
    # fi
# echo $first_line
    ordered_selections+=("$first_line")
    # echo $ordered_selections[@]
    selections[$first_line]=$file
done

# It's okay to hardcode `-l 8` here as a sensible default without checking
# whether `-l` is also in "$@", because the way that dmenu works allows a later
# argument to override an earlier one. That is, if the user passes in `-l`, our
# one will be ignored.
chosen_line=$(printf '%s\n' "${ordered_selections[@]}" | dmenu "$@")

[[ $chosen_line ]] || exit 1

for selection in clipboard primary; do
    if type -p xsel >/dev/null 2>&1; then
        xsel -i --"$selection" < "${selections[$chosen_line]}"
    else
        xclip -sel "$selection" < "${selections[$chosen_line]}"
    fi
done
find /tmp/clipmenu.${USER} -type f -print0 | tail -z --lines=+51 | xargs -0 rm &> /dev/null
