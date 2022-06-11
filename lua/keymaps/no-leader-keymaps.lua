local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window Navigate
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- Press jk fast to enter
keymap("i", "jl", "<Plug>(emmet-expand-abbr)", opts)

-- paste wont replace the content in the clipboard
keymap("v", "p", '"_dP', opts)

-- align with vscode and idea
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

keymap("n", "<C-q>", "<CMD>SessionManager load_session<CR>", opts)

-- use hop to jump to the character
keymap("n", "<C-f>", "<CMD>HopChar1CurrentLine<CR>", opts)

keymap("n", "ge", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)

-- comment line
keymap("n", "<C-_>", '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
keymap("n", "<C-\\>", '<CMD>lua require("Comment.api").toggle_current_blockwise()<CR>')
-- -- vitual mode
keymap("x", "<C-_>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
