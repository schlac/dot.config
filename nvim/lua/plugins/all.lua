return {
    -- manage plugin manager
    {"folke/lazy.nvim",},
    -- color scheme
    {"sjl/badwolf", enabled = false },
    -- highlight words <leader>k
    {"Mr-LLLLL/interestingwords.nvim", main = "interestingwords"},
    -- show git change indicators
    {"lewis6991/gitsigns.nvim",},
    -- fuzzy finder
    {"junegunn/fzf", run = "./install --bin"},
    -- fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)
    {"junegunn/fzf.vim", lazy = false, dependencies = { "junegunn/fzf" }},
    -- syntax coloring
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, 
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        ft = "markdown",
        dependencies = {
            "junegunn/fzf.vim",
            "nvim-lua/plenary.nvim",
        },
    },
    {"neovim/nvim-lspconfig", enabled = false},
}

