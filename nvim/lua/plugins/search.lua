return {
    -- highlight words <leader>k
    {"Mr-LLLLL/interestingwords.nvim", main = "interestingwords"},
    -- fuzzy finder
    {"junegunn/fzf", run = "./install --bin"},
    -- fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)
    {"junegunn/fzf.vim", lazy = false, dependencies = { "junegunn/fzf" }},
}
