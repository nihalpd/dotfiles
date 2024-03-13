local on_attach = require("lsp.base").on_attach
local lspconfig = require("lspconfig")

-- lua
lspconfig["lua_ls"].setup({
  on_attach = on_attach,
})

-- go
lspconfig["gopls"].setup({
  on_attach = on_attach,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
			gofumpt = true,
    },
  },
})

lspconfig["terraformls"].setup({
  on_attach = on_attach,
})
