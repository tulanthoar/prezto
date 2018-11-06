#!/bin/env zsh

eval "$(xdotool getmouselocation --shell|tr '[:upper:]' '[:lower:]'|xargs -n1 echo local)"
local fg_c='#aaaaaa'
local bg_c='#1a1a1a'
local font='-*-hack-medium-r-*-*-*-*-*-*-*-*-*-*'
{
    echo 'Calendar';
    cal;
} | dzen2 -e 'onstart=uncollapse;leavetitle=exit' -p -fg $fg_c -bg $bg_c -fn "$font"  -l "8" -w 250 -x "$(( x - 5 ))" -y "$(( y - 5 ))" -sa 'c'
