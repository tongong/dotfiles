#!/usr/bin/env bash

pactl subscribe |
    while read -r output ; do
        case "$output" in
            *"sink "*) sigdsblocks 5 ;;
        esac
    done
