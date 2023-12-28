vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Map Ctrl-n to switch to the next buffer
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })

-- Map Ctrl-b to switch to the previous buffer
vim.api.nvim_set_keymap('n', '<C-h>', ':bprev<CR>', { noremap = true, silent = true })

