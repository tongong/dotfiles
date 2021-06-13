# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add colors where possible
alias ls='exa -l'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
man() {
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
function cheat(){ curl cheat.sh/"$@"; }

# neovim vim tutor
alias vimtutor='nvim -c :Tutor'

# access fugitive
# kind of hacky to open vim-fugitive in a new window and than close the old one
# but I do not know of a better way
alias gg='nvim -c ":G" -c ":wincmd j" -c ":q"'

# print the source of executables. Useful for shell scripts
excat() {
    cat "$(which $1)"
}

# enable fcd to change working directory
# see scripts/fcd
alias fcd=". fcd"
