-- 1. Chặn đứng trình quản lý mặc định (Diệt tận gốc lỗi treo 3 giây)
vim.g.loaded_clipboard_provider = 1

-- 2. Tự động đẩy dữ liệu sang Windows khi bạn nhấn y hoặc d
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        -- Lấy nội dung vừa copy/xóa
        local content = vim.fn.getreg(vim.v.event.regname)
        if content ~= "" then
            -- Dùng hàm hệ thống của Neovim để "pipe" dữ liệu thẳng vào clip.exe
            -- Neovim sẽ tự lo việc đẩy 'content' vào stdin của clip.exe cho bạn
            vim.fn.system('/mnt/c/Windows/System32/clip.exe', content)
        end
    end,
})

-- 3. Cấu hình phím Paste (p) lấy dữ liệu từ Windows về
vim.keymap.set('n', 'p', function()
    -- Gọi powershell để lấy clipboard
    local content = vim.fn.system('powershell.exe -NoProfile -Command Get-Clipboard')
    -- Dọn dẹp ký tự xuống dòng của Windows (\r\n -> \n)
    content = content:gsub("\r\n", "\n")
    vim.fn.setreg('"', content)
    return 'p'
end, { expr = true, silent = true })

-- 4. Vẫn giữ unnamedplus để các thao tác nội bộ Neovim đồng nhất
vim.opt.clipboard = "unnamedplus"
