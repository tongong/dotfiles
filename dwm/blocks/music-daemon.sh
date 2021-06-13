#!/usr/bin/sh

playerctl -F metadata |
    while read -r output ; do
        case "$output" in
            *"chromium xesam:artist"*)
                artist=$(echo "$output" | tr -s ' ' | cut -d ' ' -f3-)
                ;;
            *"chromium xesam:title"*)
                title=$(echo "$output" | tr -s ' ' | cut -d ' ' -f3-)
                notify-send " $title - $artist"
                ;;
        esac
    done
