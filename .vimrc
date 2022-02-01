"Vim Wishlist ---------------------------------------------
"Comprhend linters, and why we should want them.

"Plugins ---------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'voldikss/vim-floaterm'
Plug 'ycm-core/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'tpope/vim-fugitive'
"Plug 'sheerun/vim-polyglot'
"Plug 'tpope/vim-projectionist'

call plug#end()

"Settings --------------------------------------------------

syntax on
filetype plugin on
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
"Splits end in new window
set splitbelow
set splitright
"Colorscheme stuff
colorscheme desert 
set background=dark
highlight LineNr ctermfg=140
highlight Normal ctermfg=105
highlight vimVar ctermfg=41
"Turns off preview in youcomplete
set completeopt-=preview
"Inits Floaterm
autocmd VimEnter * :FloatermNew! --silent cd %:p:h 

"Mappings --------------------------------------------------

let mapleader = " "

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>n/ :NERDTreeFind
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:floaterm_keymap_toggle = '<F1>'

"Commands --------------------------------------------------

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

"Status ----------------------------------------------------

set statusline=
set statusline+=\

"Plugin Configs --------------------------------------------

