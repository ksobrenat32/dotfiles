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

# ---	Add home bin path
if [ -d $HOME/.local/bin ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

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
alias ping='ping -c 5'
alias rm='rm --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Use vim as default editor
SELECTED_EDITOR="/usr/bin/vim"
EDITOR="/usr/bin/vim"
# Set default fzf command for vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

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
alias svim='sudo vim'
alias aports='netstat -tulanp'
alias ramfo='free -mlth'
alias psram='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'

