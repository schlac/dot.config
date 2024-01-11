-- Key Bindings

-- Easy exit terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Explore
vim.keymap.set("n", "<leader>e", vim.cmd.Explore)

-- toggle wrap
vim.keymap.set("n", "<leader>w", ":set wrap!<cr>")

-- copy/paste with os clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
-- vim.keymap.set("n", "<leader>P", [["+P]])

-- toggle paste
vim.keymap.set("n", "<leader>r", ":set paste!<cr>")

-- search/replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fuzzy finding
vim.keymap.set("n", "<leader>p", ":Files<cr>", {desc = "fuzzy find files and buffers"})
vim.keymap.set("n", "<leader>b", vim.cmd.Buffers, {desc = "show open buffers"})
vim.keymap.set("n", "<leader>gg", ":Rg<cr>", {desc = "grep in files"})
vim.cmd [[
    command! -bang -nargs=* Rgw call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
]]
vim.keymap.set("n", "<leader>g", ":Rgw <c-r><c-w><cr>")
vim.keymap.set("n", "<leader>f", [[:call fzf#vim#tags(expand('<cword>'))<cr>]])

