#.bash_aliases

# Add good defaults
alias ls='ls --color=auto'
alias la='ls -Alh --color=auto'
alias cp='cp --reflink=auto'
alias ping='ping -c 5'
alias rm='rm --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# shurtcuts
alias nohis='set +o history'
alias hig='history | grep'
alias svim='sudo vim'
alias lt='ls -a --human-readable --size -1 -S --classify'

# Random
alias rand='openssl rand -base64 32'
alias randy='cat /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9' | head -c 32 && echo'

# Monitoring
alias ramfo='free -mlth'
alias psram='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'
alias psgrep='ps ax | grep'

# Network
alias pind='ping -c 5 debian.org'
alias pbip4="curl api4.ipify.org"
alias pbip6="curl api6.ipify.org"
alias public-ports-scan='nmap -v -T4 -sV -A -p 1-65535'
alias local-ports='netstat -tulanp'
