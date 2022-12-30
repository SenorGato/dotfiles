vim.cmd[[command! -nargs=1 -complete=help Help :tabnew | :enew | :set buftype=help | :h <args>]]
vim.cmd[[command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')]]
