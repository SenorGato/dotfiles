-- Floatterm Inits

vim.cmd [[let g:floaterm_keymap_toggle = '<F1>']]
vim.cmd [[autocmd VimEnter *.js,*.html,*.css,*.ts :FloatermNew! --silent --name=webserve --cwd=<root> python3 -m http.server 8000]]
vim.cmd [[autocmd VimEnter * :FloatermNew! --silent --name=main --height=46 --position=right --width=0.4 cd %:p:h | clear ]]
vim.cmd [[autocmd BufWrite *.cpp,*h :FloatermSend --silent --name=main make]]

