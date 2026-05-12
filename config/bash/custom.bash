#!/bin/sh

# Custom bash functions

# cd to ramdisk
cr(){
    cd ~/Downloads/ramdisk/
}

# cd to git
cg(){
    cd ~/.local/git/
}

# Git pull all repositories
gipul(){
    for GITDIR in $(find ~/.local/git -name '*.git' -not -path "/var/home/ksobrenat32/.local/git/cpcfi/theory/*" -print0 | xargs -0 -n1 dirname)
    do
        echo ${GITDIR}
        git -C ${GITDIR} pull
    done
}

# Git status all repositories and print changed
gista(){
    for GITDIR in $(find ~/.local/git -name '*.git' -print0 | xargs -0 -n1 dirname)
    do
        if (git -C ${GITDIR} status | grep -q 'Changes not staged for commit:')
        then
            echo "**** ${GITDIR} ****"
            git -C ${GITDIR} status
        fi
    done
}

backup-home(){
    restic --repo sftp:moon:/var/home/core/backup/@workstation  \
        --verbose backup --one-file-system \
        --exclude=".cache/**" \
        --exclude=".git/" \
        --exclude=".local/opt/**" \
        --exclude=".local/share/Trash/**" \
        --exclude=".local/share/containers/**" \
        --exclude=".minikube/**" \
        --exclude=".var/app/**/cache/**" \
        --exclude=".var/app/com.valvesoftware.Steam/**" \
        --exclude="Downloads/**" \
        --exclude="Pictures/Screenshots/**" \
        --exclude="tmp/" \
        $HOME
}

rmnt(){
    case $1 in
	"-m"|"m") rclone mount \
            --vfs-cache-mode=full \
            --vfs-cache-max-size=1000M \
            --daemon \
            ${2}: $HOME/.local/rclone ;;
	"-ro"|"ro" ) rclone mount \
            --vfs-cache-mode=full \
            --vfs-cache-max-size=1000M \
            --daemon \
            --read-only \
            ${2}: $HOME/.local/rclone ;;
	"c"|"-c"|"u"|"-u") fusermount -u $HOME/.local/rclone ;;
	"") echo "Run rmnt -m,-ro,-u remote" ;;
    esac
}

# Custom bash aliases
# Podman fast containers
alias fcentos='podman run -it --rm quay.io/centos/centos:stream10 bash'
alias frockyl='podman run -it --rm docker.io/rockylinux/rockylinux:10 bash'
alias fdebian='podman run -it --rm docker.io/library/debian:13 bash'
alias ffedora='podman run -it --rm registry.fedoraproject.org/fedora:44 bash'

# Enviroment variables

# Use vim appimage as default editor
export SELECTED_EDITOR="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

# Set default fzf command for vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Go install
export GOPATH=$HOME/.local/opt/go

# Docker podman
export DOCKER_HOST=unix:///run/user/${UID}/podman/podman.sock

# NPM packages path
export PATH=~/.npm-global/bin:$PATH
