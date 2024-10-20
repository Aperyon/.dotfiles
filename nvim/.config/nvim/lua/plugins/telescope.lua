return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Telescope live grep" })
		vim.keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
			{ desc = "Telescope buffers" }
		)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>ft", builtin.tags, { desc = "Telescope find tags" })
	end,
}
