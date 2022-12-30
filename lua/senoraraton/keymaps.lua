--Chosing window changing paradigm.  Ctrl-w sucks. Alt sucks Ctrl + hjkl overwrites the ability to use hotkeys, did this cause collisions?

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

--Sessions

--keymap("n", "<leader>zs", ":toggle_session()", opts)
