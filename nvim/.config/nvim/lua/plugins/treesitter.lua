return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = {
				"lua",
				"html",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"json",
				"markdown",
				"css",
			},
			highlight = {
				enable = true
			}
		}
	end
}
