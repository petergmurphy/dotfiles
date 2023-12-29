require("peter.packer")
require("peter.remap")
require("peter.set")

-- Set theme
-- vim.cmd[[colorscheme NeoSolarized]]

-- Set termguicolors 
vim.opt.termguicolors = true
require("bufferline").setup{}

vim.cmd([[if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif]])

