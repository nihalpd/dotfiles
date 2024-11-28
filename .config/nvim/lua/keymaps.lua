local function map(m, k, v, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(m, k, v, opts)
end

-- fzf files
map("n", "<C-p>", "<cmd>FzfLua files<CR>")
-- fzf grep
map("n", "<leader>f", "<cmd>FzfLua live_grep<CR>")
-- fzf buffers
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>")
-- fzf commands
map("n", "<C-k>", "<cmd>FzfLua<CR>")
