local options = {
    fileencoding = "utf-8",
    wrap = false,
    tabstop = 4,
    clipboard = "unnamedplus",
    number = true,
    relativenumber = false,
    numberwidth = 4,
    backup = false,
    history = 200,
    splitbelow = true,
    splitright = true,
    autoread = true,
    shiftwidth = 4,
    expandtab = true,
    softtabstop = 4,
    scrolloff = 20,
    sidescrolloff = 8,
    incsearch = true,
    smartcase = true,
    ignorecase = true,
    hlsearch = true,
    swapfile = false,
    conceallevel = 0,
    pumheight = 10,
    showtabline = 1,
    timeoutlen = 300,
    undofile = true,
    undodir = "/home/senoraraton/.local/share/nvim/undo",
    updatetime = 300,
    writebackup = false,
    termguicolors = true,
    mouse = "",
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
}
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
vim.cmd [[let g:NERDCommentEmptyLines = 1]]
vim.opt.shortmess:append("c")
vim.cmd [[set cmdheight=0]]
