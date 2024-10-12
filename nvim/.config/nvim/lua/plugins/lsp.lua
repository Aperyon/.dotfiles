local lsp_servers = {
	'lua_ls',
	'pyright',
	'ts_ls',
}

local nonels_servers = {
	'mypy',
	'black',
	'stylua',
}


local config = function()
	local mason = require('mason')
	local mason_lspconfig = require('mason-lspconfig')
	local lspconfig = require('lspconfig')
	local mason_nonels = require('mason-null-ls')
	local none_ls = require('null-ls')
	local cmp = require 'cmp'

	-- AutoCompletion
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'buffer' },
		}),
	})

	mason.setup()


	-- NoneLSs
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	mason_nonels.setup({ ensure_installed = nonels_servers })
	none_ls.setup({
		sources = {
			none_ls.builtins.formatting.stylua,
			none_ls.builtins.formatting.black,
			none_ls.builtins.diagnostics.mypy,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end,
	})


	-- LSPs
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	mason_lspconfig.setup({ ensure_installed = lsp_servers })
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	})
	lspconfig.pyright.setup({
		capabilities = capabilities
	})
	lspconfig.ts_ls.setup({
		capabilities = capabilities
	})
	-- Keymaps
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references)
	vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format)
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
			"hrsh7th/cmp-nvim-lsp",
			'hrsh7th/cmp-buffer',
			'hrsh7th/nvim-cmp',
		},
		lazy = false,
		config = config
	},
}
