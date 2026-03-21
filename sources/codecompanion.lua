local ok, codecompanion = pcall(require, "codecompanion")
if not ok then return end

codecompanion.setup({
    -- Adapter configuration: using Copilot for all interactions
    interactions = {
        chat = {
            adapter = "copilot",
        },
        inline = {
            adapter = "copilot",
        },
        cmd = {
            adapter = "copilot",
        },
    },

    -- Kích hoạt MCP hub cho codebase
    extensions = {
        mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
                make_vars = true,
                make_slash_commands = true,
                show_result_in_chat = true,
            },
        },
    },

    strategies = {
        agent = {
            adapter = "copilot",
        },
    },

    display = {
        chat = {
            -- Show token count in chat buffer
            show_token_count = true,
            -- Show model info
            show_settings = false,
        },
        inline = {
            layout = "vertical",
        },
    },

    opts = {
        -- Log level: TRACE, DEBUG, INFO, WARN, ERROR
        log_level = "ERROR",
        -- Send code as output when using inline
        send_code = true,
    },
})

-- ╔══════════════════════════════════════════════════════════════╗
-- ║                    CodeCompanion Keymaps                    ║
-- ╚══════════════════════════════════════════════════════════════╝

local map = vim.keymap.set

-- Chat
map("n", "<Leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion: Toggle Chat" })
map("n", "<Leader>cn", "<cmd>CodeCompanionChat<CR>", { desc = "CodeCompanion: New Chat" })

-- Action Palette
map({ "n", "v" }, "<Leader>ca", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion: Action Palette" })

-- Inline prompt
map("n", "<Leader>ci", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion: Inline Prompt" })
map("v", "<Leader>ci", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion: Inline Prompt (selection)" })

-- Add visual selection to chat
map("v", "ga", "<cmd>CodeCompanionChat Add<CR>", { desc = "CodeCompanion: Add to Chat" })

-- Quick prompt from normal mode
map("n", "<Leader>cp", function()
    vim.ui.input({ prompt = "CodeCompanion: " }, function(input)
        if input and input ~= "" then
            vim.cmd("CodeCompanion " .. input)
        end
    end)
end, { desc = "CodeCompanion: Quick Prompt" })
