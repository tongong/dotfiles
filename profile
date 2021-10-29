# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes my scripts dir if it exists
if [ -d "$HOME/.scripts" ] ; then
    PATH="$HOME/.scripts:$PATH"
fi

# set PATH so it includes npm bin if it exists
if [ -d "$HOME/.npm-global/bin" ] ; then
    PATH="$HOME/.npm-global/bin:$PATH"
fi

# environment variables
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export TERMINAL=st

export MANWIDTH=80

# load private environment variables (not tracked in git)
. "$HOME/.profile-private"

# notes
# export NOTES_DIR=[private]

# set pass directory
# export PASSWORD_STORE_DIR=[private]

# diary settings
# export DIARY_KEYID=[private]
# export DIARY_DIRECTORY=[private]
export DIARY_EDITOR=nvim
export DIARY_READER=less

# autostart X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -z "${TMUX}" ]; then
  exec startx
fi
