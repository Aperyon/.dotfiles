-- Colorscheme
vim.cmd [[colorscheme catppuccin]]

-- Lines
vim.o.nu = true
vim.o.rnu = true
vim.o.colorcolumn = "79"

-- Tabs
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Diagnostics
vim.diagnostic.config({
	underline = true,
	signs = true,
	virtual_text = true,
	float = {
		show_header = true,
		source = 'if_many',
		border = 'rounded',
		focusable = false,
	},
	update_in_insert = false, -- default to false
	severity_sort = false, -- default to false
})
