local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.cursorline = true -- highlight the current cursor line

--backspace
opt.backspace = "indent,eol,start"

-- clipboard allow us to use system clipboard
opt.clipboard:append("unnamedplus")

-- split windows

opt.splitright = true
opt.splitbelow = true

-- set mouse
opt.colorcolumn = "120"

opt.hidden = true
