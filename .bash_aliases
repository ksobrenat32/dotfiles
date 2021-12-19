#.bash_aliases

# --- Aliases ---

# Add good defaults
alias ls='ls -A --color=auto'
alias cp='cp --reflink=auto'
alias ping='ping -c 5'
alias rrm='rm --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Safe rm
alias rm='mv --force -t ~/.local/share/Trash/cli'

# Default flatpak command as user
alias flatpak='flatpak --user'

# ---	Some aliases
alias pind='ping -c 5 debian.org'
alias hig='history | grep'
alias rand=' openssl rand -base64 32'
alias pbip4="curl api4.ipify.org"
alias pbip6="curl api6.ipify.org"
alias svim='sudo vim'
alias aports='netstat -tulanp'
alias ramfo='free -mlth'
alias psram='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'
alias lt='ls -a --human-readable --size -1 -S --classify'
