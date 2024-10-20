return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "luadoc", "python", "javascript", "query", "vim", "vimdoc", "markdown", "tsx" },
			highlight = {
				enable = true,
			},
		})
	end,
}
