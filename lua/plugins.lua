local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("rcarriga/nvim-notify")
	use("lewis6991/impatient.nvim")

	-- Color schemas
	use("LunarVim/Colorschemes")
	use({ "ellisonleao/gruvbox.nvim" })

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "5e3385d" }) -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim")
	use("tami5/lspsaga.nvim")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters                                │

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Which-key
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup(require("keymaps.whichkey-config"))
		end,
	})

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	-- Autosave
	use({ "Pocco81/AutoSave.nvim" })

	-- Autopair
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufReadPost",
	})

	-- Bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Git
	-- TODO fugitive
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Toggle term
	use("akinsho/toggleterm.nvim")

	-- 大纲视图
	use("stevearc/aerial.nvim")

	-- Sniprun
	use("michaelb/sniprun")

	-- . command enhance
	use("tpope/vim-repeat")
	-- vim surround
	use("tpope/vim-surround")

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use("Shatur/neovim-session-manager")

	use({ "nvim-telescope/telescope-ui-select.nvim" })

	use({ "mattn/emmet-vim" })

	use({ "dinhhuy258/vim-local-history" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
