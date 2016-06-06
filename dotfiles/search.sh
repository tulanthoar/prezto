#!/bin/env sh
sr $(sr -elvi | tail -n +2 | cut -s -f1 | dmenu -w 400 -x 1500 -b -l 50 -fn '*-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*')
