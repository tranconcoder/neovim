
--[[ vim.opt.foldmethod     = 'expr'
vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel      = 0 ]]
-- vim.opt.foldmethod = "expr"
--[[ vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Cho phép gập nội dung
vim.opt.foldlevel = 1     -- Gập các hàm nhưng giữ class mở
vim.opt.foldmethod = "manual"
vim.opt.foldclose = "all" ]]

-- Khi mở một fold, tự động mở toàn bộ block con bên trong
--[[ vim.api.nvim_set_keymap("n", "zo", "zO", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zc", "zC", { noremap = true, silent = true }) ]]


---WORKAROUND
-- vim.opt.foldenable = true
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    --[[ vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()' ]]
  end
})
---ENDWORKAROUND

require'nvim-treesitter.configs'.setup {
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}
