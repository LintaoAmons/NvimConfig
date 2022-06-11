local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Load null-ls failed")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
    formatting.markdownlint,
    formatting.google_java_format,
    -- diagnostics.semgrep,
		formatting.shfmt,
		formatting.prettier,
		formatting.stylua,

		diagnostics.shellcheck,
		diagnostics.eslint,
		-- completion.spell,
	},
})
