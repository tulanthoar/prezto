#!/bin/env zsh

  setxkbmap -option shift:both_shiftlock;
  xmodmap "${ZPDOTD}/rc/xmodm";
  numlockx on
