vim.opt.compatible = false
vim.opt.cmdheight = 2
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.showtabline = 10
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.guifont = "CaskaydiaCove Nerd Font 18"
-- vim.opt.guifont = "DroidSansMono Nerd Font 11"
-- Backup
--[[ vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false ]]
-- Fold
--[[ vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.foldclose = "all" ]]


require'lspconfig'.pyright.setup{}

vim.cmd("syntax enable")

-- Set path to nodejs
vim.g.coc_node_path = vim.fn.trim(vim.fn.system('which node'))

-- Plugin setup
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    -- LSP
    use {
      "ray-x/lsp_signature.nvim",
    }
    -- Auto stop/start to keeps RAM usage low.
    use({
        "hinell/lsp-timeout.nvim",
        requires={ "neovim/nvim-lspconfig" }
    })
    -- Rename variable
    -- JSON
    use 'neovim/nvim-lspconfig'
    use 'tamago324/nlsp-settings.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Show ts error
    use('dmmulroy/ts-error-translator.nvim')

    -- Highligth syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Show document
    use {
      "amrbashir/nvim-docs-view",
      opt = true,
      cmd = { "DocsViewToggle" },
      config = function()
        require("docs-view").setup {
          position = "right",
          width = 60,
        }
      end
    }

    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
    })


    -- Copilot
    use { "zbirenbaum/copilot.lua" }

    -- Theme
    use("catgoose/nvim-colorizer.lua")
    use 'wbthomason/packer.nvim'
    use { 'dracula/vim', as = 'dracula' }
    use 'navarasu/onedark.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'Rigellute/shades-of-purple.vim'
    use 'xiyaowong/transparent.nvim'
    use "EdenEast/nightfox.nvim"
    -- use 'marko-cerovac/material.nvim'
    use 'christianchiarulli/nvcode-color-schemes.vim'

    -- Inc rename
    use {
      "smjonas/inc-rename.nvim",
      config = function()
        require("inc_rename").setup()
      end,
    }

    --[[ Toggle term ]]
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    -- Highligth cursor
    use 'ya2s/nvim-cursorline'

    -- Startup
    use {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
            theme = 'hyper'
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

    use 'styled-components/vim-styled-components'
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use 'gertjanreynaert/cobalt2-vim-theme'
    use 'nyoom-engineering/oxocarbon'
    use 'xiyaowong/nvim-transparent'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'jiangmiao/auto-pairs'
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
    use 'KabbAmine/vCoolor.vim'
    use "folke/tokyonight.nvim"

    --[[ use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim' ]]

    --[[ Comment ]]
    use { 'fangjunzhou/comment-divider.nvim', config = {
        commentLength = 64,
    } }

    --[[ Nvim tree ]]
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'DaikyXendo/nvim-material-icon'
    use 'numToStr/Comment.nvim'


    --[[ Lualine ]]
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    use "ibhagwan/fzf-lua"
end)


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for _, source_file in ipairs(vim.fn.split(vim.fn.glob('~/.config/nvim/sources/*.lua'))) do
    vim.cmd('source ' .. source_file)
end

