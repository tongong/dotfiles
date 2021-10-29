#!/bin/sh
# X init script

# keyboard layout
# this line is also in dwm/autostart.sh; maybe delete one of them?
setxkbmap de

# load Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# window manager
exec dwm
