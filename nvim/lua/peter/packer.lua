-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Themes
	--	use("Tsuzat/NeoSolarized.nvim")
	use("navarasu/onedark.nvim")
	use("projekt0n/github-nvim-theme")
	-- Icons
	use("nvim-tree/nvim-web-devicons")

	use("karb94/neoscroll.nvim")

	use("m4xshen/autoclose.nvim")

	use("mhartington/formatter.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("ThePrimeagen/harpoon")

	use("jose-elias-alvarez/null-ls.nvim")

	use("airblade/vim-gitgutter")

	use("tpope/vim-obsession")

	use("tpope/vim-commentary")

	use("mfussenegger/nvim-lint")

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use("mg979/vim-visual-multi")

	use("mbbill/undotree")

	use("github/copilot.vim")

	use("tpope/vim-fugitive")

	use("famiu/bufdelete.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	-- Commented out for now
	-- use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				{
					plugins = {
						marks = true, -- shows a list of your marks on ' and `
						registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
						-- the presets plugin, adds help for a bunch of default keybindings in Neovim
						-- No actual key bindings are created
						spelling = {
							enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
							suggestions = 20, -- how many suggestions should be shown in the list?
						},
						presets = {
							operators = true, -- adds help for operators like d, y, ...
							motions = true, -- adds help for motions
							text_objects = true, -- help for text objects triggered after entering an operator
							windows = true, -- default bindings on <c-w>
							nav = true, -- misc bindings to work with windows
							z = true, -- bindings for folds, spelling and others prefixed with z
							g = true, -- bindings for prefixed with g
						},
					},
					-- add operators that will trigger motion and text object completion
					-- to enable all native operators, set the preset / operators plugin above
					operators = { gc = "Comments" },
					key_labels = {
						-- override the label used to display some keys. It doesn't effect WK in any other way.
						-- For example:
						-- ["<space>"] = "SPC",
						-- ["<cr>"] = "RET",
						-- ["<tab>"] = "TAB",
					},
					motions = {
						count = true,
					},
					icons = {
						breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
						separator = "➜", -- symbol used between a key and it's label
						group = "+", -- symbol prepended to a group
					},
					popup_mappings = {
						scroll_down = "<c-d>", -- binding to scroll down inside the popup
						scroll_up = "<c-u>", -- binding to scroll up inside the popup
					},
					window = {
						border = "double", -- none, single, double, shadow
						position = "bottom", -- bottom, top
						margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
						padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
						winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
						zindex = 1000, -- positive value to position WhichKey above other floating windows.
					},
					layout = {
						height = { min = 4, max = 25 }, -- min and max height of the columns
						width = { min = 20, max = 50 }, -- min and max width of the columns
						spacing = 3, -- spacing between columns
						align = "left", -- align columns left, center or right
					},
					ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
					hidden = { "<silent>", "<cmd>", "<Cmd>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
					show_help = true, -- show a help message in the command line for using WhichKey
					show_keys = true, -- show the currently pressed key and its label as a message in the command line
					triggers = "auto", -- automatically setup triggers
					-- triggers = {"<leader>"} -- or specifiy a list manually
					-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
					triggers_nowait = {
						-- marks
						"`",
						"'",
						"g`",
						"g'",
						-- registers
						'"',
						"<c-r>",
						-- spelling
						"z=",
					},
					triggers_blacklist = {
						-- list of mode / prefixes that should never be hooked by WhichKey
						-- this is mostly relevant for keymaps that start with a native binding
						i = { "j", "k" },
						v = { "j", "k" },
					},
					-- disable the WhichKey popup for certain buf types and file types.
					-- Disabled by default for Telescope
					disable = {
						buftypes = {},
						filetypes = {},
					},
				},
			})
		end,
	})
end)
