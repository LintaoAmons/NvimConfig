local which_key = require("which-key")

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local normal_mode_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
	c = { "<cmd>q!<cr>", "close(quit) buffer" },
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree(Explorer)" },
  d = {
    name = "Diff",
    f = {"<cmd>DiffviewFileHistory<cr>", "Diff file's history"},
    o = {"<cmd>DiffviewOpen<cr>", "Diff view open"},
  },
	f = {
		name = "Find/Format",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		d = { "<cmd>Telescope diagnostics<cr>", "Find lsp diagnostics" },
		e = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		l = { "<cmd>NvimTreeFindFile<cr>", "Find file's Location" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		-- TODO rebind this to <s-c-f> ⬇️
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Find Symbols"},
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		p = { "<cmd>Telescope projects<cr>", "Find Recent Projects" },
		m = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
	},
	l = {
		name = "LSP",
		-- TODO code action use telegram
		-- a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		-- 	p = {
		-- 		name = "Peek",
		-- 		d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
		-- 		t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
		-- 		i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
		-- 	},
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
	},
	n = {
		name = "No",
		l = { "<cmd>nohlsearch<CR>", "No Highlight" },
	},
	p = {
		name = "Peek",
		d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
		i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
		t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Git Hunk" },
	},
	q = {
		name = "quit",
		q = { "<cmd>qa!<cr>", "Quit completely" },
		t = { "<cmd>tabclose<cr>", "Close current tab" },
	},
	r = {
		name = "Run",
		f = { "<cmd>SnipRun<cr>", "Run file" },
    -- TODO r = {rerun}
		t = { "<Plug>SnipLive", "Run live toggle" },
	},
	s = {
		name = "Show",
		s = { "<cmd>AerialToggle<cr>", "Show structure" },
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
	w = {
		name = "Window",
		l = { "<cmd>vsplit<cr>", "Split window vertically" },
		j = { "<cmd>split<cr>", "Split window horizontal" },
		o = { "<c-w>|", "Maximize window" },
		c = { "<c-w>c", "Close window(buffer)" },
	},
	z = {
		name = "Zip(Fold)",
		c = { "zM", "fold all" },
		o = { "zR", "unfold all" },
	},
	["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
}

local visual_mode_opts = {
	mode = "v", -- Visual mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local visual_mode_mappings = {
	r = { "<Plug>SnipRun", "Run selected" },
  -- 这个refactor不知道有没有配置成功
  e = {
    name = "extract",
    f = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
  }
}

which_key.register(normal_mode_mappings, normal_mode_opts)
which_key.register(visual_mode_mappings, visual_mode_opts)
