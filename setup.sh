#!/usr/bin/bash
set -e

create_symlinks() {
target_dir="$1"
shift
for config in "$@"; do
    target_conf="$target_dir"/"$config"
    local_conf="$(realpath "$config")"
    if [[ -L "$target_conf" ]] ; then
        if [[ "$(readlink "$target_conf")" == "$local_conf" ]] ; then
            echo "SKIP '$target_conf' correct link already exists"
        else
            echo "WARN '$target_conf' already exists"
        fi
        continue
    fi
    if [[ -e "$target_conf" ]] || [[ -L "$target_conf" ]]; then
        echo "WARN '$target_conf' already exists"
        continue
    fi

    ln -s "$local_conf" "$target_conf" &&
        echo "DONE created link '$target_conf'"
done
}

# ---

create_symlinks "${HOME}" .aliases .gitconfig
create_symlinks "${XDG_CONFIG_HOME:-${HOME}/.config}" nvim emacs
