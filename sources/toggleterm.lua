vim.o.ea = false -- Disable resize window on close or open new buffer

require'toggleterm'.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  direction = "horizontal",
  persist_size = true,
  shade_terminals = true,
}

-- Start and hide terminal
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("ToggleTerm 1")  -- Mở terminal 1
    vim.cmd("ToggleTerm 2")  -- Mở terminal 2

    -- Chờ 100ms rồi ẩn cả 2 terminal
    vim.defer_fn(function()
      vim.cmd("silent! ToggleTerm 1")
      vim.cmd("silent! ToggleTerm 2")
    end, 100)
  end
})

vim.keymap.set("t", "<Esc>", function()
  -- Duyệt qua tất cả các cửa sổ
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
    local buf_name = vim.api.nvim_buf_get_name(buf)
    local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
    
    -- Chỉ focus vào cửa sổ code thực sự (không phải NvimTree, terminal, v.v.)
    if buf_type == "" and buf_name ~= "" and filetype ~= "NvimTree" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
end, { noremap = true, silent = true })


-- Open all terminal
vim.keymap.set("n", "<F12>", function()
    vim.cmd("silent! ToggleTerm 1")
    vim.cmd("silent! ToggleTerm 2")
end, { noremap = true, silent = true })

-- Close all terminal
vim.keymap.set("t", "<F12>", "<C-\\><C-n>:silent! tabdo windo if &buftype == 'terminal' | hide | endif<CR>", { noremap = true, silent = true })

-- Open all and focus terminal 1
vim.keymap.set("n", "<F9>", function()
    vim.cmd("ToggleTermToggleAll")
    vim.cmd("wincmd h")

    vim.defer_fn(function()
        vim.cmd("startinsert")  -- Vào Insert Mode
    end, 30)
end, { noremap = true, silent = true })
vim.keymap.set("i", "<F9>", function()
    vim.cmd("ToggleTermToggleAll")
    vim.cmd("wincmd h")

    vim.defer_fn(function()
        vim.cmd("startinsert")  -- Vào Insert Mode
    end, 30)
end, { noremap = true, silent = true })

-- Open all and focus terminal 2
vim.keymap.set("n", "<F10>", function()
    vim.cmd("ToggleTermToggleAll")
    vim.cmd("wincmd l")

    vim.defer_fn(function()
        vim.cmd("startinsert")
    end, 30)
end, { noremap = true, silent = true })
vim.keymap.set("i", "<F10>", function()
    vim.cmd("ToggleTermToggleAll")
    vim.cmd("wincmd l")

    vim.defer_fn(function()
        vim.cmd("startinsert")
    end, 30)
end, { noremap = true, silent = true })


--[[ -- Close or switch terminal
vim.keymap.set("t", "<F9>", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)

    if buf_name:match("term://.*#2") then
        vim.cmd("wincmd h")

        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 30)
    else
        -- Chuyển sang normal mode và đóng terminal
        vim.cmd("stopinsert")
        vim.defer_fn(function()
            vim.cmd("ToggleTermToggleAll")
            -- Focus vào cửa sổ code
            vim.defer_fn(function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
                    local buf_name_check = vim.api.nvim_buf_get_name(buf)
                    local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
                    
                    if buf_type == "" and buf_name_check ~= "" and filetype ~= "NvimTree" then
                        vim.api.nvim_set_current_win(win)
                        return
                    end
                end
            end, 30)
        end, 30)
    end
end, { noremap = true, silent = true }) ]]
-- Close or switch terminal
vim.keymap.set("t", "<F9>", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)
    if buf_name:match("term://.*#2") then
        vim.cmd("wincmd h")
        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 30)
    else
        -- Tìm cửa sổ code trước
        local target_win = nil
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
            local buf_name_check = vim.api.nvim_buf_get_name(buf)
            local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
            
            if buf_type == "" and buf_name_check ~= "" and filetype ~= "NvimTree" then
                target_win = win
                break
            end
        end
        
        -- Đóng terminal và focus
        vim.cmd("ToggleTermToggleAll")
        
        if target_win then
            vim.defer_fn(function()
                vim.api.nvim_set_current_win(target_win)
                vim.cmd("stopinsert")
            end, 50)
        end
    end
end, { noremap = true, silent = true })

-- Close or switch terminal
vim.keymap.set("t", "<F10>", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)

    if buf_name:match("term://.*#1") then
        vim.cmd("wincmd l")

        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 30)
    else
        -- Chuyển sang normal mode và đóng terminal
        vim.cmd("stopinsert")
        vim.defer_fn(function()
            vim.cmd("ToggleTermToggleAll")
            -- Focus vào cửa sổ code
            vim.defer_fn(function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
                    local buf_name_check = vim.api.nvim_buf_get_name(buf)
                    local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
                    
                    if buf_type == "" and buf_name_check ~= "" and filetype ~= "NvimTree" then
                        vim.api.nvim_set_current_win(win)
                        return
                    end
                end
            end, 30)
        end, 30)
    end
end, { noremap = true, silent = true })
