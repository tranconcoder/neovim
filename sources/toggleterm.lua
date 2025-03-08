require'toggleterm'.setup {
size = function(term)
    if term.direction == "horizontal" then
      return 7
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  direction = "horizontal",
  persist_size = true,
  shade_terminals = true,
}

vim.api.nvim_create_autocmd("VimEnter", {
    command = ":ToggleTerm 1",
})
vim.api.nvim_create_autocmd("VimEnter", {
    command = ":ToggleTerm 2",
})


vim.api.nvim_set_keymap("", "<F9>", ":ToggleTerm 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<F10>", ":ToggleTerm 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", ":ToggleTermToggleAll<CR>", { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:silent! tabdo windo if &buftype == "terminal" | hide | endif<CR>', { noremap = true, silent = true })
