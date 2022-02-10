"Vim Wishlist ---------------------------------------------
"Comprehend linters, and why we should want them.
"Html tag completion
"Fix code completion/snippets
"Fuzzy finder, and better search capabilities
"How to open function/class defs in other files(Preview?)

"Plugins ---------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
"Plug 'BurntSushi/ripgrep'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'ycm-core/youcompleteme'

call plug#end()

"Settings --------------------------------------------------
syntax on
filetype plugin on
set nocompatible

set encoding=utf-8
set nu
set nowrap
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set nobackup
set scrolloff=20
set incsearch
set ignorecase
set smartcase
set hlsearch
set history=200
set path +=**
set wildmenu
set autoread

"Splits end in new window
set splitbelow
set splitright

"Colorscheme stuff
colorscheme desert 
set background=dark
highlight LineNr ctermfg=140
highlight Normal ctermfg=105 ctermbg=234
highlight vimVar ctermfg=41
highlight Pmenu ctermbg=234 ctermfg=105
highlight lspReference cterm=underline

"Turns off preview in youcomplete
set completeopt-=preview

"Floaterm Inits
autocmd VimEnter *.js,*.html,*.css,*.ts :FloatermNew! --silent --name=webserve --cwd=<root> python3 -m http.server 8000
autocmd VimEnter * :FloatermNew! --silent --name=main --height=46 --position=right --width=0.4 cd %:p:h | clear 
autocmd BufWrite *.cpp,*h :FloatermSend --silent --name=main make

"Mappings --------------------------------------------------

let mapleader = " "

tnoremap <ESC> <C-\><C-n> 

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>n/ :NERDTreeFind
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

let g:floaterm_keymap_toggle = '<F1>'

"Paren completion
inoremap { {<CR>}<Esc>ko
inoremap {{ {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

nnoremap <Leader>ss :SaveSession<CR> 
nnoremap <Leader>os :OpenSession<CR>
:let g:session_autosave = 'no'

let g:lsp_document_highlight_enabled = 1 
nnoremap <leader>lo :LspPeekDefinition<cr>
nnoremap <leader>lp :LspPeekDeclaration<cr>
nnoremap <leader>li :LspPeekTypeDefinition<cr>
nnoremap <leader>le :LspNextError<cr>
nnoremap <leader>lw :LspNextWarning<cr>
nnoremap <leader>lpw :LspPreviousWarning<cr>
nnoremap <leader>lpe :LspPreviousError<cr>
nnoremap <leader>lh :LspHover<CR>

"The following line fixes a bug where :LspHover remaps <Esc> in insert mode
nmap <plug>() <Plug>(lsp-float-close)

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

"inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"Commands --------------------------------------------------

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
command! -nargs=1 -complete=help Help :tabnew | :enew | :set buftype=help | :h <args>
command MakeTags !ctags -R .

"Status ----------------------------------------------------

set statusline=
set statusline+=\

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua requre('telescope.builtin').help_tags()<cr>


let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

let g:airline#extensions#tabline#enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
