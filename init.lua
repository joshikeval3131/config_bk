require("kevaljoshi.plugins-setup")
require("kevaljoshi.core.options")
require("kevaljoshi.core.keymaps")
require("kevaljoshi.core.colorscheme")
require("kevaljoshi.plugins.comment")
require("kevaljoshi.plugins.nvim-tree")
require("kevaljoshi.plugins.lualine")
require("kevaljoshi.plugins.telescope")
require("kevaljoshi.plugins.nvim-cmp")
require("kevaljoshi.plugins.lsp.mason")
require("kevaljoshi.plugins.lsp.lspsaga")
require("kevaljoshi.plugins.lsp.lspconfig")
require("kevaljoshi.plugins.lsp.null-ls")
require("kevaljoshi.plugins.autopairs")
require("kevaljoshi.plugins.treesitter")

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
