return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	opts = {
		options = {
			-- theme = 'catppuccin'
			theme = "farout",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
