return {
	-- lsp signature
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local cfg = {
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach({
						bind = true, -- This is mandatory, otherwise border config won't get registered.
						handler_opts = {
							border = "rounded",
						},
					}, bufnr)
				end,
			}
			require("lsp_signature").setup(cfg)
		end,
	},

	-- lsp saga
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
					separator = " > ",
					show_file = true,
					delay = 400,
					color_mode = true,
				},
				outline = {
					layout = "float",
				},
				lightbulb = {
					enable = false,
					sign = false,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	-- mason
	{

		"williamboman/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"whoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local mason = require("mason")
			local mason_tool = require("mason-tool-installer")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"marksman",
					"tsserver",
					"eslint",
					"html",
					"bashls",
					"clangd",
					"tailwindcss",
				},
				automatic_installation = true,
			})
			mason_tool.setup({
				run_on_start = true,
				ensure_installed = {
					"stylua", -- lua formatter
					"isort", -- formatter for sorting import python
					"black", -- formatter for python
					"prettier", -- formatter
					"flake8", -- linting for python
					"beautysh", -- for bash
				},
			})
		end,
	},
}
