Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'stevearc/vim-arduino'
Plug 'alvan/vim-closetag'
"Plug 'sheerun/vim-polyglot'
filetype plugin on
set nocompatible


"Mappings --------------------------------------------------

let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'

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

"Status ----------------------------------------------------

set statusline=
set statusline+=\

"The void" -------------------------------------------------
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua requre('telescope.builtin').help_tags()<cr>


set omnifunc=syntaxcomplete#Complete

let g:closetag_filenames = '*.html, *.xhtml, *.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_close_shortcut = '<leader>>'

