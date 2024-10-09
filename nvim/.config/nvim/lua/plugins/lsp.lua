return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
	    "williamboman/mason.nvim",
	    "nvimtools/none-ls.nvim",
	},
	config = function()
	    require("mason-null-ls").setup({
		ensure_installed = { 
		    "stylua", 
		    "mypy", 
		    "black",
		}
	    })
	end,
    },
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "nvimtools/none-ls.nvim",
	},
	config = function()
	    require("mason").setup()
	    require("mason-lspconfig").setup({
		ensure_installed = {
		    "lua_ls",
		    "pyright",
		    "ts_ls",
		}
	    })
	    local null_ls = require("null-ls")
	    local lspconfig = require("lspconfig")

	    null_ls.setup({
		sources = {
		    null_ls.builtins.formatting.stylua,
		    null_ls.builtins.completion.spell,
		},
	    })

	    lspconfig.pyright.setup{}

	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
	    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
	end
    }
}
