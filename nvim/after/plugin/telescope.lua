local builtin = require('telescope.builtin')
local wk = require("which-key")

-- Sets the cwd to the directory where Neovim was started
local start_dir = vim.loop.cwd()

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ cwd = start_dir })
end, { desc = "Find file" })

vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({ cwd = start_dir, use_git_root = false })
end, { desc = "Find file (git repo)" })

vim.keymap.set('n', '<leader>ft', function()
  builtin.grep_string({ search = vim.fn.input("Grep > "), cwd = start_dir })
end, { desc = "Find text" })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })

-- require('telescope').setup{
--     defaults = {
--         mappings = {
--             i = {
--                 ["<esc>"] = require('telescope.actions').close,
--             },
--         }
--     },
-- }

