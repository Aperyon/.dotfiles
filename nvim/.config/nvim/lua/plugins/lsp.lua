local lsp_servers = {
    'lua_ls',
    'pyright',
    'ts_ls',
}

local nonels_servers = {
    'mypy',
    'black',
}

local config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')
    local mason_nonels = require('mason-null-ls')
    local none_ls = require('null-ls')


    mason.setup()

    -- LSPs
    mason_lspconfig.setup({ ensure_installed = lsp_servers })
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.ts_ls.setup({})

    -- NoneLSs
    mason_nonels.setup({ ensure_installed = nonels_servers })
    none_ls.setup({
	sources = {
	    none_ls.builtins.formatting.stylua,
	    none_ls.builtins.completion.spell,
	}
    })

    -- Keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
end

return {
    {
	"williamboman/mason.nvim",
	dependencies = {
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	    "nvimtools/none-ls.nvim",
	    "jay-babu/mason-null-ls.nvim",
	},
	lazy = false,
	config = config     
    },
}
