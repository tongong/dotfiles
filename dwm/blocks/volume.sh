#!/usr/bin/env bash

# https://unix.stackexchange.com/a/577807

MUTE=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $5 }')
MUTESYMBOL=$([ $MUTE == on ] && echo "墳" || echo "婢")

echo "$MUTESYMBOL $(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ printf("%03d\n", $3) }')%"
