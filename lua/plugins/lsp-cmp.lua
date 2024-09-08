--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  ╰──────────────────────────────────────────────────────────╯
return {
	--  ╭────────────────╮
	--  │   LSP ZERO     │
	--  ╰────────────────╯
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},

	--  ╭────────────────╮
	--  │   NVIM CMP     │
	--  ╰────────────────╯
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			-- these are buffer completions1
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "FelipeLema/cmp-async-path" },
			{ "Snikimonkd/cmp-go-pkgs" },
			{ "David-Kunz/cmp-npm" },
			{ "SergioRibera/cmp-dotenv" },
			{ "saecki/crates.nvim", tag = "stable" },
		},
		config = function()
			local cmp_action = require("lsp-zero").cmp_action()
			local cmp = require("cmp")
			local cmp_npm = require("cmp-npm")
			local cmp_crates = require("crates")

			-- set up npm completion
			cmp_npm.setup({})
			cmp_crates.setup({})
			-- set up completion
			cmp.setup({
				preselect = "item",
				mapping = cmp.mapping.preset.insert({
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- tab to select
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Navigate between snippet placeholder
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),

				formatting = {
					fields = { "menu", "abbr", "kind" },

					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = "λ",
							luasnip = "⋗",
							buffer = "Ω",
							path = "🖫",
							nvim_lua = "Π",
						}

						item.menu = menu_icon[entry.source.name]

						return item
					end,
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "async_path" },
					{ name = "buffer" },
					{ name = "npm", keyword_length = 4 },
					{ name = "crates" },
					{ name = "go_pkgs" },
					{ name = "dotenv" },
				}),
			})
		end,
	},

	-- ╭───────────╮
	-- │ LSPCONFIG │
	-- ╰───────────╯
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			-- │ GLOBALS │
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			-- │ CMP LSP CAPABILITIES │
			local lsp_defaults = lspconfig.util.default_config
			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- │ LSP BORDER │
			require("lspconfig.ui.windows").default_options.border = "single"

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			-- │ LSP BORDERS │
			local border = {
				{ "┌", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "┐", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "┘", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "└", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			lsp_zero.setup_servers({ "tsserver", "lua_ls" })
			--| C & C++ |
			lspconfig.clangd.setup({
				capabilities = {
					offsetEncoding = "utf-16",
				},
				handlers = handlers,
			})
			--| CSS |
			lspconfig.cssls.setup({
				handlers = handlers,
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})
			--| JSON |
			lspconfig.jsonls.setup({
				handlers = handlers,
				filetypes = { "json", "jsonc" },
				init_options = {
					provideFormatter = true,
				},
			})
			--| HTML |
			lspconfig.html.setup({
				handlers = handlers,
				settigns = {
					css = {
						lint = {
							validProperties = {},
						},
					},
				},
			})
			--| TEXLAB |
			lspconfig.texlab.setup({
				handlers = handlers,
				settings = {
					texlab = {
						auxDirectory = ".",
						bibtexFormatter = "texlab",
						build = {
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
							executable = "latexmk",
							forwardSearchAfter = false,
							onSave = false,
						},
						chktex = {
							onEdit = false,
							onOpenAndSave = false,
						},
						diagnosticsDelay = 300,
						formatterLineLength = 100,
						forwardSearch = {
							args = {},
						},
						latexFormatter = "latexindent",
						latexindent = {
							modifyLineBreaks = false,
						},
					},
				},
			})
			--| JAVA |
			lspconfig.jdtls.setup({
				handlers = handlers,
			})
			--| RUST |
			lspconfig.rust_analyzer.setup({
				handlers = handlers,
			})
			-- │ YAML SERVER │
			lspconfig.yamlls.setup({
				handlers = handlers,
				settings = {
					yaml = {
						validate = true,
						hover = true,
						completion = true,
						format = {
							enable = true,
							singleQuote = true,
							bracketSpacing = true,
						},
						editor = {
							tabSize = 2,
						},
						schemaStore = {
							enable = true,
						},
					},
					editor = {
						tabSize = 2,
					},
				},
			})
			-- │ TAILWIND SERVER │
			lspconfig.tailwindcss.setup({
				handlers = handlers,
			})
		end,
	},

	--  ╭─────────────╮
	--  │   MASON     │
	--  ╰─────────────╯
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
					height = 0.8,
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
					"gopls",
					"jdtls",
					"ltex",
					"texlab",
					"intelephense",
					"yamlls",
				},
				automatic_installation = true,
			})

			-- this makes sure Mason runs the servers
			mason_lspconfig.setup({
				handlers = {
					-- lsp.default_setup,
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
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
}
