vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "x", '"_x') -- use x to delete but dont put it in register

-- split windows

keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make split window equal size
keymap.set("n", "<leader>sx", ":close<CR>") -- core current split window this is useful as i used to close whole buffer

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabClose<CR>") -- Close tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- nvim-tree toggle
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>,", ":NvimTreeFindFile<CR>") -- toggle file explorer

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- telescope
keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ag", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- buffer toggle
keymap.set("n", "<leader>[", ":bp<CR>") -- previous tab
keymap.set("n", "<leader>]", ":bn<CR>") -- previous tab

--lsp start and stop commands
keymap.set("n", "<leader>lx", ":LspStop<CR>") -- previous tab
keymap.set("n", "<leader>ls", ":LspStart<CR>") -- previous tab
keymap.set("n", "<leader>lr", ":LspRestart<CR>") -- previous tab

keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format()
end, { buffer = true })

vim.g["diagnostics_active"] = false

function Toggle_diagnostics()
	if vim.g.diagnostics_active then
		vim.g.diagnostics_active = false
		vim.diagnostic.disable()
	else
		vim.g.diagnostics_active = true
		vim.diagnostic.enable()
	end
end

vim.cmd([[lua vim.diagnostic.disable()]])

vim.keymap.set(
	"n",
	"<leader>xd",
	Toggle_diagnostics,
	{ noremap = true, silent = true, desc = "Toggle vim diagnostics" }
)
