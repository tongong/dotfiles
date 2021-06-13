#!/usr/bin/env bash

MEM=$(free -m | grep Mem | awk '{printf "%03d", ($3/$2)*100}')

echo " $MEM%"
