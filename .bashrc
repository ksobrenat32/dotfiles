# Ksobrenatural .bashrc

# ---	Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ---	Add home path
PATH="$HOME/.local/bin:$PATH"

# ---	If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ---	History configuration
# Ignore lines that begin with a space or that are duplicated
HISTCONTROL=ignoreboth 
# Append to existing history
shopt -s histappend 
# Setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=1000000
HISTFILESIZE=2000000
HISTTIMEFORMAT="%y-%m-%d-%T "

# ---	Useful config
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Add good defaults
alias ls='ls -A --color=auto'
alias cp='cp --reflink=auto'
# Use vim as default editor
SELECTED_EDITOR="/usr/bin/vim"
EDITOR="/usr/bin/vim"
# Set the autocompletation to case insensitive 
bind 'set completion-ignore-case on'

# ---	Colors
PS1="\[\e[3;33m\]\[\e[40m\][\u@\H]\[\e[0m\]\[\e[0;37m\]:\W $\[\e[0m\] "

# ---	Some aliases
alias pind='ping -c 5 debian.org'
alias hig='history | grep'
# Generate random password of 32 characters
alias rand='cat /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9' | head -c 32 && echo'
alias pbip4="curl api4.ipify.org"
alias pbip6="curl api6.ipify.org"

