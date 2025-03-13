-- vim.cmd.colorscheme "catppuccin"
require('onedark').load()
-- require('colorbuddy').colorscheme('cobalt2')
-- vim.cmd[[colorscheme tokyonight-night]]

-- vim.cmd[[colorscheme dracula]]
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

