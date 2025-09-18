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

# cd to cpcfi
cpcfi(){
    cd ~/.local/git/cpcfi/problems/cses
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
        --verbose backup --one-file-system $HOME \
        --exclude="*.class" \
        --exclude="*.o" \
        --exclude=".git/" \
        --exclude="tmp/" \
        --exclude="sdk/" \
        --exclude="Downloads/**" \
        --exclude="Pictures/Screenshots/**" \
        --exclude=".cache/**" \
        --exclude=".local/git/**" \
        --exclude=".local/tmp/**" \
        --exclude=".local/share/containers/**" \
        --exclude=".local/share/Trash/**" \
        --exclude=".local/opt/**" \
        --exclude=".minikube/**" \
        --exclude=".var/app/**/cache/**" \
        --exclude=".var/app/com.valvesoftware.Steam/**"
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

cop(){
    # If it is written in C
    if [[ $1 == *.c ]]; then
        gcc -g3 -o3 -Wall -Werror -pipe "$1" -o "${1%.c}.o"
    fi

    # If it is written in C++
    if [[ $1 == *.cpp ]]; then
        g++ -g3 -o3 -Wall -Werror -pipe "$1" -o "${1%.cpp}.o"
    fi

    # If it is written in Java
    if [[ $1 == *.java ]]; then
        javac $1
    fi
}

# Custom bash aliases
# Podman fast containers
alias fcen='podman run -it --rm quay.io/centos/centos:stream10 bash'
alias fdeb='podman run -it --rm docker.io/library/debian:12 bash'

# AI
alias ollama-start='podman run -d --replace -p 11434:11434 -v /home/ksobrenat32/.local/opt/ollama:/root/.ollama:Z --name ollama docker.io/ollama/ollama serve'
alias ollama-stop='podman stop ollama'
alias ollama='podman exec -it ollama ollama'

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

# Quartus
export QSYS_ROOTDIR=".local/opt/intelFPGA_lite/quartus/sopc_builder/bin"

