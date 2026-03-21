-- ~/.config/nvim/sources/clipboard.lua
-- Auto-detect WSL vs native Linux

local function is_wsl()
    local f = io.open('/proc/version', 'r')
    if f then
        local content = f:read('*a')
        f:close()
        return content:lower():find('microsoft') ~= nil
    end
    return false
end

if is_wsl() then
    -----------------------------------------------------------------
    -- WSL 2: Manual clipboard bridge qua Windows
    -----------------------------------------------------------------

    -- Block default provider (tranh 3s hang)
    vim.g.loaded_clipboard_provider = 1

    -- Copy: yank -> PowerShell Set-Clipboard voi UTF-8 InputEncoding
    -- clip.exe khong xu ly UTF-8 dung tu WSL, phai dung PowerShell
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("WslClipboard", { clear = true }),
        callback = function()
            local content = table.concat(vim.v.event.regcontents, "\n")
            if content ~= "" then
                vim.fn.system(
                    'powershell.exe -NoProfile -Command "'
                    .. '[Console]::InputEncoding = [System.Text.Encoding]::UTF8;'
                    .. '[Console]::In.ReadToEnd() | Set-Clipboard"',
                    content
                )
            end
        end,
    })

    -- Paste: lay clipboard tu Windows (ep UTF-8 output)
    local paste_cmd = 'powershell.exe -NoProfile -Command "'
        .. '[Console]::OutputEncoding = [System.Text.Encoding]::UTF8;'
        .. 'Get-Clipboard -Raw"'

    local function sync_win_clipboard()
        local content = vim.fn.system(paste_cmd)
        -- Chuyen Windows line endings
        content = content:gsub("\r\n", "\n")
        -- Xoa trailing newline thua cua powershell
        content = content:gsub("\n$", "")
        vim.fn.setreg('"', content)
    end

    vim.keymap.set('n', 'p', function()
        sync_win_clipboard()
        return 'p'
    end, { expr = true, silent = true, desc = "Paste from Windows clipboard" })

    vim.keymap.set('n', 'P', function()
        sync_win_clipboard()
        return 'P'
    end, { expr = true, silent = true, desc = "Paste before from Windows clipboard" })

    vim.opt.clipboard = "unnamedplus"

else
    -----------------------------------------------------------------
    -- Native Linux: dung provider system
    -----------------------------------------------------------------
    if vim.fn.executable('xclip') == 1 then
        vim.g.clipboard = {
            name = 'xclip',
            copy = {
                ['+'] = 'xclip -selection clipboard',
                ['*'] = 'xclip -selection primary',
            },
            paste = {
                ['+'] = 'xclip -selection clipboard -o',
                ['*'] = 'xclip -selection primary -o',
            },
            cache_enabled = 0,
        }
    elseif vim.fn.executable('xsel') == 1 then
        vim.g.clipboard = {
            name = 'xsel',
            copy = {
                ['+'] = 'xsel --clipboard --input',
                ['*'] = 'xsel --primary --input',
            },
            paste = {
                ['+'] = 'xsel --clipboard --output',
                ['*'] = 'xsel --primary --output',
            },
            cache_enabled = 0,
        }
    elseif vim.fn.executable('wl-copy') == 1 then
        -- Wayland
        vim.g.clipboard = {
            name = 'wl-clipboard',
            copy = {
                ['+'] = 'wl-copy',
                ['*'] = 'wl-copy --primary',
            },
            paste = {
                ['+'] = 'wl-paste --no-newline',
                ['*'] = 'wl-paste --no-newline --primary',
            },
            cache_enabled = 0,
        }
    end

    vim.opt.clipboard = "unnamedplus"
end
