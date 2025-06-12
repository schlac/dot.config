-- Easy mail answers
local author = string.gsub(vim.fn.system { 'git', 'config', 'get', 'user.name' } .. " <" .. vim.fn.system { 'git', 'config', 'get', 'user.email' } .. ">", '\n', '')
vim.keymap.set({"n", "v"}, "<leader>rr", ":append \nReviewed-by: " .. author .. "\n<c-c>")
vim.keymap.set({"n", "v"}, "<leader>ra", ":append \nAcked-by: " .. author .. "\n<c-c>")
vim.keymap.set({"n", "v"}, "<leader>rt", ":append \nTested-by: " .. author .. "\n<c-c>")
vim.keymap.set({"n", "v"}, "<leader>rs", ":append \nSigned-off-by: " .. author .. "\n<c-c>")

vim.keymap.set({"n", "v"}, "<leader>ss", ":append \n\n[...]\n\n<c-c>")

vim.keymap.set({"n", "v"}, "<leader>rc", ":append \n--\nCheers,\n\nChristoph\n<c-c>")

-- see https://stackoverflow.com/a/4468491 / https://github.com/junegunn/fzf.vim/pull/733
function delte_buffer_keep_split()
  vim.cmd('bp|bd #')
end
vim.api.nvim_create_user_command('BD', delte_buffer_keep_split, {})
