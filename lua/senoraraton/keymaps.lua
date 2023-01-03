local keymaps = {}
local opts = { noremap = true, silent = true }
local term_opts = { silent = true}
local keymap = vim.api.nvim_set_keymap

--Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

--Normal
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<A-h>", ":wincmd h<CR>", opts)
keymap("n", "<A-j>", ":wincmd j<CR>", opts)
keymap("n", "<A-k>", ":wincmd k<CR>", opts)
keymap("n", "<A-l>", ":wincmd l<CR>", opts)

keymap("n", "<leader>e", ":Lex 10<cr>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--Visual

--Hold buffer on paste
vim.cmd[[xnoremap <expr> p 'pgv"'.v:register.'y`>']]
vim.cmd[[xnoremap <expr> P 'Pgv"'.v:register.'y`>']]

--Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--Term
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

--Paren completion
keymap("i", "{", "{}<Esc>ha", opts)
keymap("i", "{{", "{<CR>}<Esc>ko", opts)
keymap("i", "(", "()<Esc>ha", opts)
keymap("i", "[", "[]<Esc>ha", opts)
keymap("i", '"', '""<Esc>ha', opts)
keymap("i", "'", "''<Esc>ha", opts)
keymap("i", "`", "``<Esc>ha", opts)

-- LSP

function keymaps.lsp_on_attach(_,bufnr)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", ':vsplit | lua vim.lsp.buf.definition()<cr>, bufopts')
    vim.keymap.set("n", "gdd", ':belowright split | lua vim.lsp.buf.definition()<cr>, bufopts')
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>", bufopts)
    vim.keymap.set("n", "vr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "pp", vim.lsp.buf.code_action, bufopts)
end

return keymaps
