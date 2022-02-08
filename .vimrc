"Vim Wishlist ---------------------------------------------
"Comprehend linters, and why we should want them.
"Html tag completion
"Fix code completion/snippets
"Fuzzy finder, and better search capabilities
"How to open function/class defs in other files(Preview?)

"Plugins ---------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'voldikss/vim-floaterm'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'puremourning/vimspector'
"Plug 'scrooloose/syntastic'
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
set path +=**

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

"Floaterm Inits
autocmd VimEnter * :FloatermNew! --silent --name=main --height=46 --position=right --width=0.4 cd %:p:h | clear 
autocmd VimEnter *.js,*.html,*.css,*.ts :FloatermNew! --silent --name=webserve --cwd=<root> python3 -m http.server 8000
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


"inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"Commands --------------------------------------------------

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')


"Status ----------------------------------------------------

set statusline=
set statusline+=\

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader> rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup ENDf
