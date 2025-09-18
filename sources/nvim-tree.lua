vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Cấu hình nvim-tree để luôn cập nhật thư mục làm việc hiện tại
require("nvim-tree").setup({
  reload_on_bufenter = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sync_root_with_cwd = true,  -- Đồng bộ root với thư mục làm việc
})

-- Gán phím F2 để toggle NvimTree
-- vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle name=desktop<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-b>', ':lua require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd() })<CR>', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap('n', '<C-b>', ':lua require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd() })<CR>', { noremap = true, silent = true })

--[[ vim.keymap.set('n', '<C-b>', function()
  require("nvim-tree.api").tree.find_file({ open = true })
end, { noremap = true, silent = true }) ]]

vim.keymap.set('n', '<C-b>', function()
  local api = require("nvim-tree.api")
  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.find_file({ open = true, focus = true })
  end
end, { noremap = true, silent = true })




-- Khi mở Neovim với một đối số là thư mục (ví dụ: nvim .), tự động chuyển đến thư mục đó và mở NvimTree
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argv = vim.fn.argv()
    if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
      vim.cmd("cd " .. argv[1])
      require("nvim-tree.api").tree.open({ path = vim.loop.cwd() })
    end
  end,
})



-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
