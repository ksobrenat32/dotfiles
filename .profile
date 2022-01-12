#.profile

# Add home bin path
if [ -d ~/.local/bin ]; then
	export PATH="~/.local/bin:$PATH"
fi

# Use vim as default editor
export SELECTED_EDITOR="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

# Git GPG key
export GPG_TTY=$(tty)

# Set default fzf command for vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# Nodejs
export NODEJS_HOME=$HOME/.local/opt/node
export PATH=$PATH:$NODEJS_HOME/bin
