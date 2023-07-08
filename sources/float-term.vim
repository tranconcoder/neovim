let g:floaterm_title = '╣ TERMINAL ╠'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_position = 'center'
let g:floaterm_borderchars = "═║═║╔╗╝╚"

" Configuration example
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'


"nnoremap <silent> <leader>t :FloatermToggle<CR>
"tnoremap <silent> <leader>t <C-\><C-n>:FloatermToggle<CR>

" Compile and excute java file
"nnoremap <silent> <leader>j :FloatermSend clear && javac % && java % <CR> <bar> :FloatermToggle <CR>

autocmd BufEnter * :hi FloatermBorder guibg=transparent<CR>
