# .config usage

Clone this to `~/.config`.

Set `XDG_CONFIG_HOME="$HOME\.config"`.
More info at
https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
.


# Contents

## Emacs

Has to be linked to be found by emacs.

`ln -s ~/.config/emacs/emacs.el ~/.emacs.el`


## Neovim (nvim)

Has to be set to be used by vim as well.

`MYVIMRC=~/.config/nvim/init.vim`

