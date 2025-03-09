require('fzf-lua').setup{
    winopts = {
        height           = 0.8,            -- window height
        width            = 0.8,            -- window width
        border           = "rounded",
    },
    files = {
        find_opts = [[-type f -not -path '*/.git/*' -not -path '*/node_modules/*']]
    }
}

vim.keymap.set("n", "<C-p>", function()
  vim.cmd("FzfLua files 1")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", function()
  vim.cmd("FzfLua buffers")
end, { noremap = true, silent = true })
