#!/bin/sh
# X init script

# keyboard layout
# this line is also in dwm/autostart.sh; maybe delete one of them?
setxkbmap de

# load Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# gnome keyring is needed for minecraft
mkdir -p "$HOME"/.local/share/keyrings
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# window manager
exec dwm
