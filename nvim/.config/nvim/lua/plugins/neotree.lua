return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", 
	"MunifTanjim/nui.nvim",
    },
    config = function()
	vim.keymap.set('n', '\\', ':Neotree toggle<cr>', {})
	require('neo-tree').setup({
	    filesystem = {
		follow_current_file = {
		    enabled = true,
		    leave_dirs_open = false
		},
	    },
	    buffers = {
		follow_current_file = {
		    enabled = true,
		    leave_dirs_open = false
		},
	    },
	})
    end
}
