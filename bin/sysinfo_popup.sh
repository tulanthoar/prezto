#!/bin/env zsh

eval "$(xdotool getmouselocation --shell|tr '[:upper:]' '[:lower:]'|xargs -n1 echo local)"
local fg_c='#aaaaaa'
local bg_c='#1a1a1a'
local width=260
local font='-*-hack-medium-r-*-*-*-*-*-*-*-*-*-*'
local host=$(uname -n)
local kernel=$(uname -r)
local upt=$(uptime -p | cut -c 4-)
local packages=$(pacman -Q | wc -l)
local updated=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0);
         printf "%s %s",$1,$2;}' /var/log/pacman.log)
{
    print "System Information" # Fist line goes to title
    # The following lines go to slave window
    print "Host: $host "
    print "Kernel: $kernel "
    print "Uptime: $upt "
    print "Pacman: $packages packages"
    print "Last update: $updated"
} | dzen2 -p -x "$(( x - 5 ))" -y "$(( y - 5 ))" -w "$width" -l "5" -sa 'l' -ta 'c'\
   -e 'onstart=uncollapse;leavetitle=exit'
