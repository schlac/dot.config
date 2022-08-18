#!/usr/bin/env bash
set -e

create_symlinks() {
config_dirs=("$@")
for config_dir in "${config_dirs[@]}"; do
    target_conf="${XDG_CONFIG_HOME:-~/.config}/$config_dir"
    local_conf="$(realpath "$config_dir")"
    [ -e ] && echo "SKIP '$target_conf' already exists" && continue
    ln -s "$local_conf" "$target_conf" && echo "DONE created link '$target_conf'"
done
}

# ---

create_symlinks nvim emacs
