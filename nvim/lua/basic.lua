vim.g.mapleader = " "         -- map leader key (default '\')

vim.opt.number = true         -- Show line numbers
vim.opt.cursorline = true     -- Show hline on cursor 
vim.opt.cursorcolumn = true   -- Show vline on cursor
vim.opt.mouse = "nv"          -- Use mouse in normal mode

-- Show trailing whitespace and spaces before a tab:
vim.opt.list = true           -- Show trailing whitespaces
vim.opt.listchars = { tab = ":▸:", trail = "▒" } -- Set chars for whitespaces

vim.opt.linebreak = true      -- Break lines at word (requires Wrap lines)
vim.opt.textwidth = 80        -- Line wrap (number of cols)
vim.opt.showbreak = "+++"     -- Wrap-broken line prefix
vim.opt.colorcolumn = "+1"    -- Show vertical ruler at textwidth

vim.opt.termguicolors = true  -- true color
vim.opt.visualbell = true     -- Use visual bell (no beeping)
vim.opt.conceallevel = 1      -- Allow cosmetic text replacement

vim.opt.ruler = true          -- Show row and column ruler information
vim.opt.showcmd = true        -- Show current command
vim.opt.showmatch = true      -- Highlight matching brace
vim.opt.hlsearch = true       -- Highlight all search results

vim.opt.smartcase = true      -- Enable smart-case search
vim.opt.ignorecase = true     -- Always case-insensitive
vim.opt.incsearch = true      -- Searches for strings incrementally
vim.opt.scrolloff = 6         -- Give context when scrolling

-- vim.opt.expandtab = true      -- Use spaces instead of tabs
-- vim.opt.smartindent = true    -- Enable smart-indent
vim.opt.smarttab = true       -- Enable smart-tab
-- vim.opt.shiftwidth = 4        -- Number of auto-indent spaces
-- vim.opt.softtabstop = 4       -- Number of spaces per Tab

vim.opt.wildmenu = true       -- Use command line menu
vim.opt.spell = true          -- Enable spell-checking
vim.opt.spelllang = {"en_us","de_de"} -- Set spell checking to en_US
-- vim.opt.encoding=utf-8 nobomb      -- use UTF8 without BOM

vim.opt.lazyredraw = true     -- don't update the display while executing macros
vim.opt.ttyfast = true        -- Send more characters at a given time.

vim.opt.updatetime = 1200     -- write to swp earlier (also for CursorHold triggers)
vim.opt.autoread = true       -- Reload contents automatically from disk
vim.opt.backspace = {"indent","eol","start"} -- Backspace behaviour
if vim.fn.has('win32') == 0 then       -- Do not do this when running in Windows
    vim.opt.path = vim.o.path .. "**"  -- _fuzzy find_ in sub-directories
end

vim.opt.tags = "./tags;$HOME"  -- Search tags locally and upwards

vim.cmd.syntax("enable")       -- Enable syntax highlighting
vim.cmd.filetype("plugin on")  -- Enable visual filetry

-- create persistent file backups
-- see 'set backupdir?' for location
--vim.system({'mkdir', '-p', '~/.backup/'}, { text = true }):wait()
vim.opt.backupdir = { "~/.backup/", "/tmp//" } -- 
--vim.system({'mkdir', '-p', '~/.swp/'}):wait()
vim.opt.directory = { "~/.swp/", "/tmp//" }    -- 
--vim.system({'mkdir', '-p', '~/.undo/'}):wait()
vim.opt.undodir = { "~/.undo/" ,"/tmp//" }     -- 
vim.opt.backup = true                          -- write backups
-- undo file
if vim.fn.has('persistent_undo') == 1 then     -- check if your vim version supports it
    vim.opt.undofile = true                    -- turn on the feature
end

