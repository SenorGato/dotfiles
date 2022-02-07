"Vim Wishlist ---------------------------------------------
"Comprehend linters, and why we should want them.
"Html tag completion
"Fix code completion/snippets
"Set floaterm to open in ROOT
"Write hotkey that runs a webserver in the ROOT directory and hides the term
"Fuzzy finder, and better search capabilities
"How to open function/class defs in other files(Preview?)
"Rebind ESC to CapsLock

"Plugins ---------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'voldikss/vim-floaterm'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
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

"Turns off preview in youcomplete
set completeopt-=preview

"Inits Floaterm
autocmd VimEnter * :FloatermNew! --silent --height=46 --position=right --width=0.4 cd %:p:h | clear 
autocmd BufWrite *.cpp :FloatermSend --silent make
"autocmd VimEnter FileType javascript,html,css,typescript :FloatermNew! --silent --cwd=<root> python3 -m http.server 8000

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
map <F12> :FloatermKill!<CR> \| :wq<CR>
map <F11> :FloatermKill!<CR> \| :q!<CR>

"Paren completion
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

let g:lsp_document_highlight_enabled = 0
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


"inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"Commands --------------------------------------------------

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')


"Status ----------------------------------------------------

set statusline=
set statusline+=\
