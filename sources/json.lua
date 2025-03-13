local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local server_opts = {}

-- lua
server_opts.sumneko_lua = {
  settings = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. '/lua'] = true,
        }
      }
    }
  }
}

local common_setup_opts = {
  -- on_attach = on_attach,
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(
  --   vim.lsp.protocol.make_client_capabilities()
  -- )
}

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
  function (server_name)
    local opts = vim.deepcopy(common_setup_opts)
    if server_opts[server_name] then
      opts = vim.tbl_deep_extend('force', opts, server_opts[server_name])
    end
    lspconfig[server_name].setup(opts)
  end
})
