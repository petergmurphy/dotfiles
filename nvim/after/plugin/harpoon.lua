local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

vim.keymap.set("n", "<C-j>", function() ui.nav_prev() end, { desc = "Navigate to previous harpoon file" })
vim.keymap.set("n", "<C-k>", function() ui.nav_next() end, { desc = "Navigate to next harpoon file" })
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Navigate to file 3" })
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Navigate to file 4" })

