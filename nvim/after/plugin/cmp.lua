local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
cmp.setup {
  sources = {
    { name = 'nvim_lsp', },
  },

  mapping = {

    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  },

  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      unpack = unpack or table.unpack
      local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
      local indent = string.match(line_text, '^%s*')
      local replace = vim.split(args.body, '\n', true)
      local surround = string.match(line_text, '%S.*') or ''
      local surround_end = surround:sub(col)

      replace[1] = surround:sub(0, col - 1)..replace[1]
      replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
      if indent ~= '' then
        for i, line in ipairs(replace) do
          replace[i] = indent..line
        end
      end

      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
    end,
  },
}

