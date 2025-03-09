require('fzf-lua').setup{
    winopts = {
        height           = 0.8,            -- window height
        width            = 0.8,            -- window width
        border           = "rounded",
    }
}

vim.keymap.set("n", "<C-p>", function()
  vim.cmd("FzfLua files 1")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", function()
  vim.cmd("FzfLua buffers")
end, { noremap = true, silent = true })
