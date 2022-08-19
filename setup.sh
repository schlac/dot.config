#!/usr/bin/bash
set -ex

create_symlinks() {
target_dir="$1"
shift
for config in "$@"; do
    target_conf="$target_dir"/"$config"
    local_conf="$(realpath "$config")"
    if test -e "$target_conf"; then
        echo "SKIP '$target_conf' already exists"
        continue
    else
        ln -s "$local_conf" "$target_conf" &&
            echo "DONE created link '$target_conf'"
    fi
done
}

# ---

create_symlinks "${HOME}" .gitconfig
create_symlinks "${XDG_CONFIG_HOME:-${HOME}/.config}" nvim emacs
