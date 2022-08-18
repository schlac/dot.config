# .config usage

Clone this to a location of you choosing and run the `./setup.sh` script to
create symlinks into `XDG_CONFIG_HOME` (default=`$HOME\.config`).

More info about XDG can be found at
https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
.


# Contents

## Emacs

Has to be linked to be found by emacs.

`ln -s ~/.config/emacs/emacs.el ~/.emacs.el`


## Neovim (nvim)

If intended has to be set to be used by vim as well.

`MYVIMRC=~/.config/nvim/init.vim`

