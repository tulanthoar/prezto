#!/bin/env zsh

  setxkbmap -option shift:both_shiftlock;
  xmodmap "${ZPDOTD}/xmodm";
  numlockx on
