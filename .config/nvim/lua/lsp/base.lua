local base = {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
base.on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  local keymap = vim.keymap.set

  -- fzf<3lua for references
  keymap("n", "gr", "<cmd>FzfLua lsp_references<CR>")

  -- Code action
  keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

  -- Rename all occurrences of the hovered word for the entire file
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

  -- Peek definition
  -- You can edit the file containing the definition in the floating window
  -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
  -- It also supports tagstack
  -- Use <C-t> to jump back
  -- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
  -- Go to definition
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

  -- Peek type definition
  -- You can edit the file containing the type definition in the floating window
  -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
  -- It also supports tagstack
  -- Use <C-t> to jump back
  -- keymap("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>")

  -- Go to type definition
  keymap("n", "gy", "<cmd>Lspsaga goto_type_definition<CR>")

  -- Show line diagnostics
  -- You can pass argument ++unfocus to
  -- unfocus the show_line_diagnostics floating window
  -- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

  -- Show cursor diagnostics
  -- Like show_line_diagnostics, it supports passing the ++unfocus argument
  -- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

  -- Show buffer diagnostics
  keymap("n", "<leader>sb", "<cmd>Trouble document_diagnostics<CR>")
  -- Show workspace diagnostics
  keymap("n", "<leader>sw", "<cmd>Trouble workspace_diagnostics<CR>")

  -- Diagnostic jump
  -- You can use <C-o> to jump back to your previous location
  keymap("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  keymap("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")

  -- Diagnostic jump with filters such as only jumping to an error
  keymap("n", "[G", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap("n", "]G", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)

  -- Toggle outline
  keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

  -- Hover Doc
  -- If there is no hover doc,
  -- there will be a notification stating that
  -- there is no information available.
  -- To disable it just use ":Lspsaga hover_doc ++quiet"
  -- Pressing the key twice will enter the hover window
  -- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

  -- If you want to keep the hover window in the top right hand corner,
  -- you can pass the ++keep argument
  -- Note that if you use hover with ++keep, pressing this key again will
  -- close the hover window. If you want to jump to the hover window
  -- you should use the wincmd command "<C-w>w"
  keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

  -- Call hierarchy
  keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
  keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

  -- Floating terminal
  keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

return base
