#!/usr/bin/env bash

# only run this script once
if [ -e /tmp/.autostart-done ]
then
    echo "autostart already done."
else
    touch /tmp/.autostart-done

    # window manager settings
    picom &
    # config for the old laptop:
    # xrandr --output VGA-1 --off --output HDMI-1 --mode 1920x1080 --pos 1368x0 --rotate normal --output LVDS-1 --mode 1366x768 --pos 0x0 --rotate normal
    xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
    nitrogen --restore &

    # dwm statusbar
    statnot ~/.dwm/statnot/statnot-config.py &
    dsblocks &
    ~/.dwm/blocks/pulse-daemon.sh &
    ~/.dwm/blocks/music-daemon.sh &

    # refresh arch package lists (to show number of updates in statusbar
    sudo /usr/local/bin/refreshpkglist &

    # autostart programs
    clipmenud &
    # syncthing -no-browser &

    # set keyboard layout (required for xdotool to work properly)
    # xdotool still struggles with "`" character...
    # also remap caps lock to escape key
    setxkbmap de -option caps:escape
fi
