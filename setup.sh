#!/usr/bin/bash
set -e

RC=0
FORCE=
case "$1" in
    --force|-f)
        FORCE=1
        ;;
esac

create_symlinks() {
target_dir="$1"
shift
for config in "$@"; do
    target_conf="$target_dir"/"$config"
    local_conf="$(realpath "$config")"
    if [[ -L "$target_conf" ]] ; then
        target="$(readlink "$target_conf")"
        if [[ "$target" == "$local_conf" ]] ; then
            echo "SKIP '$target_conf' correct link already exists"
            continue
        else
            echo "WARN '$target_conf' link already exists pointing to '$target'"
            [[ ! $FORCE ]] && RC=3 && continue
        fi
    fi
    if [[ -f "$target_conf" ]]; then
        echo "WARN '$target_conf' file already exists"
        [[ ! $FORCE ]] && RC=3 && continue
    fi
    if [[ -e "$target_conf" ]]; then
        echo "WARN '$target_conf' already exists"
        RC=3
        continue
    fi

    if [[ ( $FORCE ) ]]; then
        if [[ -L "$target_conf" ]] || [[ -f "$target_conf" ]];then
            echo "WARN replacing '$target_conf'"
            rm -f "$target_conf"
        fi
    fi

    ln -s "$local_conf" "$target_conf"
    echo "DONE created link '$target_conf'"
done
}

# ---

create_symlinks "${HOME}" .aliases .bashrc .bash_profile .profile .gitconfig
create_symlinks "${XDG_CONFIG_HOME:-${HOME}/.config}" nvim emacs

exit $RC
