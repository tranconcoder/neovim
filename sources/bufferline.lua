require("bufferline").setup{
    options = {
        mode = "buffers",
        separator_style = "slant",
        buffer_close_icon = 'x',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        numbers = function(opts)
            return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(1, {severity = seve.ERROR})
                local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, link = "DiagnosticError"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, link = "DiagnosticWarn"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, link = "DiagnosticHint"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, link = "DiagnosticInfo"})
                end
                return result
            end,
        }
    }
}

