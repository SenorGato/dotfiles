"Vim Wishlist ---------------------------------------------
"Comprehend linters, and why we should want them.
"Html tag completion
"Fix code completion/snippets
"Folding
"Configure arduino bindings
"Work on understanding vimspector/better debugging

"Plugins ---------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline-themes'
Plug 'stevearc/vim-arduino'
"Plug 'sheerun/vim-polyglot'
"Plug 'BurntSushi/ripgrep'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do' : 'make'}
"Plug 'tpope/vim-fugitive'

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
"set completeopt-=preview

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

let g:floaterm_keymap_toggle = '<F1>'

"Paren completion
inoremap { {}<Esc>ha
inoremap {{ {<CR>}<Esc>ko

inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

nnoremap <Leader>ss :SaveSession<CR> 
nnoremap <Leader>os :OpenSession<CR>
:let g:session_autosave = 'no'


nnoremap <leader>lo :YcmCompleter GoToDefinition<cr>
nnoremap <leader>lp :YcmCompleter GoToDecleration<cr>
nnoremap <leader>li :YcmCompleter GetType<cr>
nnoremap <leader>lh :YcmCompleter GoToInclude<cr>
nnoremap <leader>lu :YcmCompleter GoToReferences<CR>
nnoremap <leader>le :LspNextError<cr>
nnoremap <leader>lw :LspNextWarning<cr>
nnoremap <leader>lpw :LspPreviousWarning<cr>
nnoremap <leader>lpe :LspPreviousError<cr>

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

"Commands --------------------------------------------------

command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
command! -nargs=1 -complete=help Help :tabnew | :enew | :set buftype=help | :h <args>
command MakeTags !ctags -R --c++-kinds=+p --fields=iaS --extra=+q . 

"Status ----------------------------------------------------

set statusline=
set statusline+=\

"The void" -------------------------------------------------
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua requre('telescope.builtin').help_tags()<cr>

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

let g:airline#extensions#tabline#enabled = 1

set omnifunc=syntaxcomplete#Complete
"inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"The Lua pit
"lua<<EOF
"require('telescope').setup {
"  extensions = {
"    fzf = {
"      fuzzy = true,                    -- false will only do exact matching
"      override_generic_sorter = true,  -- override the generic sorter
"      override_file_sorter = true,     -- override the file sorter
"      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
"                                       -- the default case_mode is "smart_case"
"    }
"  }
"}
"require('telescope').load_extension('fzf')
"EOF
"
"
""" session auto-saving and things
    "set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize
    "if has("unix") || &shellslash | let s:pathsep = '/' | else | let s:pathsep = '\' | endif
    "let g:session_file = join([getcwd(),".vim.session"], s:pathsep)
    "if (argc() == 0) && empty(v:this_session) && filereadable(g:session_file)
    "    let g:session = 1
    "else
    "    let g:session = 0
    "endif
    "
    "function! Session_save(filename)
    "    if g:session > 0
    "        echomsg 'Saving current session to ' . a:filename
    "        execute 'mksession! ' . a:filename
    "        if !filewritable(a:filename)
    "            echoerr 'Unable to save current session to ' . a:filename
    "        endif
    "    endif
    "endfunction
    "
    "function! Session_load(filename)
    "    if g:session > 0
    "        echomsg 'Loading session from ' . a:filename
    "        if filereadable(a:filename)
    "            execute 'source ' . a:filename
    "        endif
    "    endif
    "endfunction
    "
    "augroup session
    "    autocmd!
    "    autocmd VimEnter * call Session_load(g:session_file)
    "    autocmd VimLeave * call Session_save(g:session_file)
    "augroup end
    "
    "
"fu! SaveSess()
"    execute 'mksession! ' . getcwd() . '/.session.vim'
"endfunction
"
"fu! RestoreSess()
"if filereadable(getcwd() . '/.session.vim')
"    execute 'so ' . getcwd() . '/.session.vim'
"    if bufexists(1)
"        for l in range(1, bufnr('$'))
"            if bufwinnr(l) == -1
"                exec 'sbuffer ' . l
"            endif
"        endfor
"    endif
"endif
"endfunction
"
"autocmd VimLeave * call SaveSess()
"autocmd VimEnter * nested call RestoreSess()
