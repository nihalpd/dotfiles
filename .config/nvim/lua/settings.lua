local opt = vim.opt
local g = vim.g

-- map leader key to space
g.mapleader = " "

-- switch buffers without having to save
opt.hidden = true

-- use case insensitive search, except when using capital letters
opt.ignorecase = true
opt.smartcase = true

-- display line numbers on the left
opt.number = true

-- display relative line number for easy jumping
opt.relativenumber = true

-- disable swap files
opt.swapfile = false

-- number of visual spaces per TAB
opt.tabstop = 2
-- autoindent indents 2 spaces
opt.shiftwidth = 2
-- number of spaces in tab when editing
opt.softtabstop = 2


vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
