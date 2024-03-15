-- vim.cmd.colorscheme("habamax")

require('kanagawa').setup({
    compile = true,              -- enable compiling the colorscheme
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",         -- try "wave" or "dragon" !
    },
})
vim.cmd.colorscheme("kanagawa")
