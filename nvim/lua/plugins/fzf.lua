return {
    -- fuzzy finder
    {"junegunn/fzf", build = "./install --all", version = "*"},
    -- fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)
    -- {"junegunn/fzf.vim", lazy = false, dependencies = { "junegunn/fzf" }},
    {"ibhagwan/fzf-lua", lazy = false, dependencies = { "junegunn/fzf", "nvim-tree/nvim-web-devicons" }, },
}
