#!/bin/sh
# installs all programs in this repo

RESET='\e[0m'
YELLOW='\e[1;33m'

SCRIPTDIR="$(realpath "$(dirname "$0")")"

PROGRAMS="clipnotify clipmenu diary dmenu dwm dwmblocks passmenu-plus pinentry-dmenu slock st statnot sxiv"

for i in $PROGRAMS; do
    echo -e "${YELLOW}Installing $i.${RESET}"
    cd "$SCRIPTDIR/$i"
    make
    sudo make install
done
