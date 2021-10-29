# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colors in framebuffer
# https://askubuntu.com/a/153493
if [ "$TERM" = "linux" ]; then
	# 8 normal colors
	echo -en "\e]P0242424",  # black
	echo -en "\e]P1d25252",  # red
	echo -en "\e]P2a4c161",  # green
	echo -en "\e]P3ffc56d",  # yellow
	echo -en "\e]P46c99ba",  # blue
	echo -en "\e]P5d096d9",  # magenta
	echo -en "\e]P6bdd6ff",  # cyan
	echo -en "\e]P7ffffff",  # white

	# 8 bright colors
	echo -en "\e]P8535353",  # black
	echo -en "\e]P9f00c0c",  # red
	echo -en "\e]PAc1df74",  # green
	echo -en "\e]PBe1e48a",  # yellow
	echo -en "\e]PC8ab6d9",  # blue
	echo -en "\e]PDefb5f7",  # magenta
	echo -en "\e]PEdbf4ff",  # cyan
	echo -en "\e]PFffffff",  # white
    clear # for background artifacting
fi

# add colors where possible
alias ls='exa -l'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
function man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# shell promt
PS1='\[\e[01;92m\]\w \[\e[01;34m\]\$ \[\e[00m\]'

# Directoy up alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# nvim alias
alias v='nvim'

# cheat.sh shortcut
function cheat(){ curl cheat.sh/"$1"; }

# neovim vim tutor
alias vimtutor='nvim -c :Tutor'

# access fugitive
# kind of hacky to open vim-fugitive in a new window and than close the old one
# but I do not know of a better way
alias gg='nvim -c ":G" -c ":wincmd j" -c ":q"'

# print the source of executables. Useful for shell scripts
excat() {
    cat "$(which "$1")"
}

alias drag='dragon-drag-and-drop --and-exit'
function drop() {
    uri="$(dragon-drag-and-drop --target --and-exit)"
    if [[ "$uri" == "file://"* ]];
    then
        # filenames are not allowed to be longer than 999999
        # i don't know how to make a substring expansion till the end
        uri=${uri:7:999999}
        sel="$(echo -e "copy\nmove" | dmenu -l 10)"
        [[ "$sel" == copy ]] && cp "$uri" .
        [[ "$sel" == move ]] && mv "$uri" .
    else
        echo "$uri"
    fi
}

# enable fcd to change working directory
# see scripts/fcd
alias fcd=". fcd"
