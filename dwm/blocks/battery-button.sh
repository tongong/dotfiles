#!/bin/sh

acpi -b | grep "Battery 1" | xargs -0 notify-send