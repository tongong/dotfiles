#!/usr/bin/env sh

# refresh with
# sudo /usr/local/bin/refreshpkglist

echo " $(pacman -Qu | wc -l)"
