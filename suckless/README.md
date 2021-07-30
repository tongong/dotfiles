# suckless

This repository contains all my builds of suckless (and suckless-like (and all
other kinds of)) programs.

I wanted to have all these programs in one repo but the problem is that it is
now extremely hard to pull upstream changes. I will probably switch to
something like `git subtree` in the future.


## backlight-control
- from https://github.com/Hendrikto/backlight_control
- renamed from `backlight_control` to `backlight-control`
- added `backlight-control get` command
- added option to update my statusbar after changes

## clipmenu & clipnotify
- not modified by me, but it's there nevertheless lol

## diary
- taken from https://github.com/synox/diary
- added Makefile
- added `diary-list` command and integration for `diary-print` and `diary-edit`
  when no arguments are given
- added `diary-new` command to entries with the text editor

## dmenu 5.0
- https://tools.suckless.org/dmenu/patches/case-insensitive/
- https://tools.suckless.org/dmenu/patches/password/ with `*` instead of `.`
- https://tools.suckless.org/dmenu/patches/initialtext/
- my own version of `dmenu_run` which starts some programs in the terminal (see
  `config/dmenu/terminal`)

## dsblocks
- custom blocks

## dwm 6.2
- official patches
    - https://dwm.suckless.org/patches/actualfullscreen/
    - https://dwm.suckless.org/patches/autostart/
    - https://dwm.suckless.org/patches/alpha/dwm-fixborders-6.2.diff
    - https://dwm.suckless.org/patches/pertag/
    - https://dwm.suckless.org/patches/restartsig/
    - https://dwm.suckless.org/patches/rotatestack/
    - https://dwm.suckless.org/patches/statusallmons/
    - https://dwm.suckless.org/patches/vanitygaps/
    - https://dwm.suckless.org/patches/warp/
    - http://dwm.suckless.org/patches/zoomswap/
    - http://dwm.suckless.org/patches/scratchpad/
    - dwm-dwmblocks patch (without systray) see
      https://github.com/ashish-yadav11/dwmblocks/blob/master/patches/dwm-dwmblocks-6.2.diff
      (I modified this version to work with `dsblocks`, so it's more like
      https://github.com/ashish-yadav11/dsblocks/blob/master/patches/dwm-dsblocks-6.2.diff )
- my own patches
    - activetagindicator-patch; inspired by
      https://dwm.suckless.org/patches/activetagindicatorbar/
    - modified version of https://dwm.suckless.org/patches/fsignal/ to set the
      title bar text (for statnot)
    - I created patch files for these two patches but I did not start with a
      clean build. So the line numbers and maybe (hopefully not!) also the
      surrounding code won't be correct. Manual patching will very likely be
      required to apply these.

## dwmblocks
- for blocks see `dwm/blocks` (from repository root folder)

## passmenu-plus
- extension of the standard passmenu
- added ability to not only type password but also login or login and password

## pinentry-dmenu
- there are so many different versions of this...
- this is the one from https://github.com/drincoxyz/pinentry-dmenu
- not modified

## slock 1.4
- https://tools.suckless.org/slock/patches/dpms/

## st 0.8.4
- https://st.suckless.org/patches/alpha/
- https://st.suckless.org/patches/bold-is-not-bright/
- https://st.suckless.org/patches/ligatures/
- https://st.suckless.org/patches/scrollback/ (all of them)

## statnot
- also not modified, but who cares

## sxiv 26
- added better color support to make the bar the same color as the background;
  see https://github.com/muennich/sxiv/issues/339
