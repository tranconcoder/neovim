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

local function is_terminal_1_visible()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win) -- Lấy buffer của cửa sổ
    local buf_name = vim.api.nvim_buf_get_name(buf) -- Lấy tên buffer

    if buf_name:match("term://.*#1") then
      return true -- Nếu terminal 1 đang hiển thị
    end
  end
  return false -- Terminal 1 không hiển thị
end

local function is_any_terminal_visible()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    
    if buf_name:match("term://") then
      return true -- If any terminal is visible
    end
  end
  return false -- No terminals are visible
end

-- Open all terminal
vim.keymap.set("n", "<F12>", function()
  vim.cmd("ToggleTermToggleAll")
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
-- Close all
vim.keymap.set("t", "<F9>", "<C-\\><C-n>:silent! tabdo windo if &buftype == 'terminal' | hide | endif<CR>", { noremap = true, silent = true })

-- Open all and focus terminal 2
vim.keymap.set("n", "<F10>", function()
    vim.cmd("ToggleTermToggleAll")
    vim.cmd("wincmd l")

    vim.defer_fn(function()
        vim.cmd("startinsert")  -- Vào Insert Mode
    end, 30)
end, { noremap = true, silent = true })
-- Close all
vim.keymap.set("t", "<F10>", "<C-\\><C-n>:silent! tabdo windo if &buftype == 'terminal' | hide | endif<CR>", { noremap = true, silent = true })

