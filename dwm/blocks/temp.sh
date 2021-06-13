#!/usr/bin/env bash

TEMP=$(sensors -u | grep -m 1 temp1_input | awk '{printf "%03d", $2}')

echo " $TEMP°C"
