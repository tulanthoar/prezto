#!/bin/env sh

ps aux | grep -E "\<keratin-d$" || keratin-d 2> /dev/null
