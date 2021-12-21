# Ksobrenatural .bashrc

# ---	Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the autocompletation to case insensitive 
bind 'set completion-ignore-case on'

# ---	Colors
PS1="\[\e[3;33m\]\[\e[40m\][\u@\H]\[\e[0m\]\[\e[0;37m\]:\W $\[\e[0m\] "

# ---	Source custom aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# ---	Source profile
if [ -f ~/.profile ]; then
	. ~/.profile
fi
