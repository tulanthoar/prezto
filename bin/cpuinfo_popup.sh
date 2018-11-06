#!/bin/env zsh
eval "$(xdotool getmouselocation --shell|tr '[:upper:]' '[:lower:]'|xargs -n1 echo local)"
local fg_c='#aaaaaa'
local bg_c='#1a1a1a'
local width=450
local font='-*-hack-medium-r-*-*-*-*-*-*-*-*-*-*'

conky -c "$HOME/.conkyrccpu" | dzen2 -p -x "$(( x - 5 ))" -y "$(( y - 5 ))" -w "$width" -l "13" -sa 'l' -ta 'c'\
    -e 'onstart=uncollapse;leavetitle=exit' -fn "$font" -fg $fg_c -bg $bg_c
