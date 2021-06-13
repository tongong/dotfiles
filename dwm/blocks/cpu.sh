#!/usr/bin/env bash

# CPU=$(mpstat -P ALL 1 1 | grep -E "Average:\s+[0-9]" | awk '$12 ~ /[0-9.]+/ { printf("%03d\% ", 100 - $12) }')
# echo " $CPU"

cat /proc/loadavg | { read one five fifteen ; echo " $one" ; }
