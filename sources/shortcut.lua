-- Search text in all files
vim.keymap.set("n", "<leader>s", "<cmd>Ag<CR>", { noremap = true })
vim.keymap.set("n", "<leader>f", "<cmd>Rg<CR>", { noremap = true })

-- Save file and format with Prettier
vim.keymap.set("n", "<C-s>", "<cmd>w! | silent Prettier<CR>", { noremap = true, silent = true })

-- Reload Neovim config
vim.keymap.set("n", "<F5>", "<cmd>w! | source ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })

-- Resize window
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +1<CR>", { noremap = true })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -1<CR>", { noremap = true })
vim.keymap.set("n", "<M-Down>", "<cmd>resize +1<CR>", { noremap = true })
vim.keymap.set("n", "<M-Up>", "<cmd>resize -1<CR>", { noremap = true })

-- Switch window
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true })

-- Close buffer
vim.keymap.set("n", "<C-w>", "<cmd>bd!<CR>", { noremap = true })

-- Move line up and down
vim.keymap.set("n", "m", "<cmd>m+<CR>", { noremap = true })
vim.keymap.set("n", "n", "<cmd>m-2<CR>", { noremap = true })

-- Comment divider
vim.keymap.set("n", "f", "<cmd>CommentDividerLine<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", "<cmd>CommentDividerBox<CR>", { noremap = true })

