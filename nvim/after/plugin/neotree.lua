local neotree = require('neo-tree')

vim.api.nvim_set_keymap('n', '<C-z>', ':Neotree toggle<CR>', { noremap = true, silent = true })

neotree.setup({
    buffers = {
        show_unloaded = true,
    },
    filesystem = {
        follow_current_file = {
            enabled = true, -- Make NeoTree follow the current file
        },
    },
})

