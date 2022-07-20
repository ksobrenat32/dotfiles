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

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
