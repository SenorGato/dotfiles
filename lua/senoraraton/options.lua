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
vim.cmd [[set cmdheight=0]]
vim.cmd [[let g:NERDCommentEmptyLines = 1]]
vim.opt.shortmess:append("c")

--Set LSP output
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { source = "always", border = "single" },
})
--Colorscheme

vim.cmd [[colorscheme tokyonight-moon]]
--vim.cmd [[highlight LineNr ctermfg=140]]
--vim.cmd [[highlight Normal ctermfg=105 ctermbg=234]]
--vim.cmd [[highlight vimVar ctermfg=41]]
--vim.cmd [[highlight vimVar ctermfg=41]]
--vim.cmd [[highlight Pmenu ctermbg=234 ctermfg=105]]
--vim.cmd [[highlight lspReference cterm=underline]]
--vim.cmd [[highlight EndOfBuffer ctermbg = blue]]

-- Floatterm Inits

vim.cmd [[let g:floaterm_keymap_toggle = '<F1>']]
vim.cmd [[autocmd VimEnter *.js,*.html,*.css,*.ts :FloatermNew! --silent --name=webserve --cwd=<root> python3 -m http.server 8000]]
vim.cmd [[autocmd VimEnter * :FloatermNew! --silent --name=main --height=46 --position=right --width=0.4 cd %:p:h | clear ]]
vim.cmd [[autocmd BufWrite *.cpp,*h :FloatermSend --silent --name=main make]]

--Commands

vim.cmd[[command! -nargs=1 -complete=help Help :tabnew | :enew | :set buftype=help | :h <args>]]
vim.cmd[[command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')]]

--Sessions

--local session_opts = {
  --log_level = 'info',
  --auto_session_enable_last_session = false,
  --auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  --auto_session_enabled = true,
  ----auto_save_enabled = nil,
  ----auto_restore_enabled = nil,
  ----auto_session_suppress_dirs = nil,
  --auto_session_use_git_branch = nil,
  ----auto_session_create_enabled = true,
  ---- the configs below are lua only
  --bypass_session_save_file_types = nil
--}
--
--function _G.close_all_floating_wins()
  --for _, win in ipairs(vim.api.nvim_list_wins()) do
    --local config = vim.api.nvim_win_get_config(win)
    --if config.relative ~= '' then
      --vim.api.nvim_win_close(win, false)
    --end
  --end
--end


--require('auto-session').setup{
    --session_opts,
    --pre_save_cmds = { _G.close_all_floating_wins },
--}
--require('session-lens').setup {
    --prompt_title = 'Saison',
    --path_display = {'shorten'},
--}

--LuaLine

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    --lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {nil},
    lualine_y = {nil},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}










