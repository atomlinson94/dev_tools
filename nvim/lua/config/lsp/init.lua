local M = {}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)

  -- Configure highlighting
  require("config.lsp.highlighting").setup(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- for nvim-cmp

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

-- Setup LSP handlers
require("config.lsp.handlers").setup()

function M.setup()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "✓"
      }
    }
  }
  -- TODO(atomlinson@anduril.com): Solve delay for LSP to load on first opening a buffer
  require("mason-lspconfig").setup {
    ensure_installed = {
      "clangd",
      "lua_ls",
      "pyright",
      "rnix",
      "rust_analyzer",
    },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
  }
end

return M
