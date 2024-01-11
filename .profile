#!/bin/sh
# .profile

# set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set editor
EDITOR="$(command -v nvim.appimage)" ||
    EDITOR="$(command -v nvim)" ||
    EDITOR="$(command -v vim)" ||
    EDITOR="$(command -v vi)"
export EDITOR
export VISUAL="$EDITOR"
