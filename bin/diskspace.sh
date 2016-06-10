#!/bin/sh

df -h | grep -E '/$' | grep -Eo '\<[0-9]{2}G\>' | tail -n1
