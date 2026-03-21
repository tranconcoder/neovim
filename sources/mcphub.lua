local ok, mcphub = pcall(require, "mcphub")
if not ok then return end

mcphub.setup({
    -- Tự động bật các MCP tools hữu ích cho coding
    -- Có thể cài thêm các open-source MCP server khác bằng npm
    servers = {
        -- Ví dụ nếu bạn dùng node.js thì bật mcp-server-sqlite, mcp-server-github...
        -- Hiện tại mcphub tự detect và run nếu bạn config
    },
    -- Mặc định mcphub hoạt động tốt out-of-the-box
})
