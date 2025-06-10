#!/bin/bash
# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=4000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

# merge history of all terminals
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# adjust path
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1${PATH:+":$PATH"}"
    fi
}
# add podman desktop compose
#pathadd "$HOME/.local/share/containers/podman-desktop/extensions-storage/podman-desktop.compose/bin"
# add go/bin
GOBIN="$(command -v go)" && pathadd "$(go env GOPATH)/bin"
# add cargo/bin
[ -d $HOME/.cargo/bin ] && pathadd "$HOME/.cargo/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

init_starship() {
    # enable starship prompt
    if [[ -x "$(command -v starship)" ]]; then
        eval "$(starship init bash)"
    fi
}
init_starship

## configure fzf fuzzy finder
# use rg to find files
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{.git/*,node_modules}"'

# #export FZF_COMPLETION_TRIGGER='*'
# # use CTRL-T, CTRL-R, ALT-C shortcuts
# source /usr/share/fzf/shell/key-bindings.bash
#
# # complete paths for code
# _fzf_setup_completion path code git

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

[[ -x "$(command -v lab)" ]] && source <(lab completion)

mac_specific() {
    # do something under Mac OS X platform
    # use colors
    export CLICOLOR=1
    # configure bsd/osx colors
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    # configure linux colors
    export LS_COLORS='di=1;34;40:ln=1;36;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

    # emacs alias
    alias emacs='open -a /Applications/Emacs.app'

    # activate bash completion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    # git completion
    [ -z ${GIT_DIR} ] && echo "GIT_DIR not set!"
    if [ -f "${GIT_DIR}/etc/bash_completion.d/git-completion.bash" ]; then
        source "${GIT_DIR}/etc/bash_completion.d/git-completion.bash"
    fi
}

# record all terminal display
#record_typescript(){
#    local typescript_file="${HOME}/typescript/typescript-$(date -u "+%Y-%m-%d")-${HOSTNAME:-$(hostname)}-$(basename $(tty))-$$.log"
#
#    # don't use tee because this does not play well with editors and auto-coloring
#    #exec >  >(tee -ia $typescript_file)
#    #exec 2> >(tee -ia $typescript_file >&2)
#
#    # use script/ttyrec instead, but since a sub-process is started do this only once!
#    local rec_cmd=script
#    [[ "$(ps -p $PPID -ocommand=)" == "$rec_cmd "* ]] \
#        || exec $rec_cmd "$typescript_file"
#}
#record_typescript

# store cmd history
#mkdir -p ~/.logs
#export PROMPT_COMMAND='[ "$(id -u)" -ne 0 ] && echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d")-$(basename $(tty)).log'

# do platform dependent setup
if [[ "$(uname)" == 'Darwin' ]]; then
    # do something under Mac OS X platform
    mac_specific
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # do something under GNU/Linux platform
    true
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # do something under Windows NT platform
    true
fi

# Load aliases
alias_path="$HOME/.aliases"
[[ -e "$alias_path" ]] && . "$alias_path"
