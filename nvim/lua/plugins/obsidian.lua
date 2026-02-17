return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "junegunn/fzf.vim",
            "ibhagwan/fzf-lua",
            "hrsh7th/nvim-cmp",
        },
        lazy = false,
    },
}
