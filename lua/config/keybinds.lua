-- Setting the Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set    -- Just to make it clear :D

keymap("n", "<leader>fm", ":Ex<CR>")      -- Openning netrw

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

keymap("n", "<leader>so", ":so<CR>")
