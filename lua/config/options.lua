-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab Options
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

-- Smart Indention
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Searching && Navigation
vim.opt.ignorecase = true     -- Case-insensitive Searching unless used
vim.opt.smartcase = true
vim.opt.incsearch = true   -- Incremental Search
vim.opt.hlsearch = true    -- Highlight matches

-- UI && Appearance
vim.opt.termguicolors = true     -- True color support
vim.opt.signcolumn = "yes"       -- Always show sign column
vim.opt.cursorline = true      -- Show corsur line
vim.opt.showmatch = true      -- Show matching brackets

-- Better line wrapping
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- General Optins
vim.opt.mouse = "a"     -- Enable mouse support
vim.opt.clipboard = "unnamedplus"   -- Using the system clipboard
vim.opt.undofile = true    -- Keeping the undo history
