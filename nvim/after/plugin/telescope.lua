local builtin = require('telescope.builtin')

-- Sets the cwd to the directory where Neovim was started
local start_dir = vim.loop.cwd()

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ cwd = start_dir })
end, {})

vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({ cwd = start_dir })
end, {})

vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > "), cwd = start_dir })
end)

vim.keymap.set('n', '<leader>b', builtin.buffers, {})


