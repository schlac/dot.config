-- see https://stackoverflow.com/a/4468491 / https://github.com/junegunn/fzf.vim/pull/733
function delte_buffer_keep_split()
  vim.cmd('bp|bd #')
end
vim.api.nvim_create_user_command('BD', delte_buffer_keep_split, {})
