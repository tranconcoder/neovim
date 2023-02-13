let g:floaterm_title = 'terminal'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_position = 'bottomright'

nnoremap <silent> <leader>t :FloatermToggle<CR>
tnoremap <silent> <leader>t <C-\><C-n>:FloatermToggle<CR>

autocmd BufEnter * :hi FloatermBorder guibg=transparent<CR>
