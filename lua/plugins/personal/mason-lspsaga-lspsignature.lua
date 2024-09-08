return {
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
}

--[[ lsp signature
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
    --]]
