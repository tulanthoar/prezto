#!/bin/env sh

ps aux | grep -E clipmenud$ || clipmenud 2> /dev/null
