#!/usr/bin/env bash

# only run this script once
if [ -e /tmp/.autostart-done ]
then
    echo "autostart already done."
else
    touch /tmp/.autostart-done

    # window manager settings
    picom &
    nitrogen --restore &
    # run slock on standby and suspend
    xss-lock -l ~/.dwm/transfer-sleep-slock.sh &

    # dwm statusbar
    statnot ~/.dwm/statnot/statnot-config.py &
    dsblocks &
    ~/.dwm/blocks/pulse-daemon.sh &
    ~/.dwm/blocks/music-daemon.sh &

    # refresh arch package lists (to show number of updates in statusbar
    # sudo /usr/local/bin/refreshpkglist &

    # autostart programs
    clipmenud &
    # syncthing -no-browser &
    timetracker | timetracker-save &

    # set keyboard layout (required for xdotool to work properly)
    # xdotool still struggles with "`" character...
    # also remap caps lock to escape key
    setxkbmap de -option caps:escape
fi
