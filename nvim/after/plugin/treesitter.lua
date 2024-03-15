require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed) see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
      "bash",
      "c",
      "go",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "vim",
      "vimdoc",
      "yaml",
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  indent = { enable = true },

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

