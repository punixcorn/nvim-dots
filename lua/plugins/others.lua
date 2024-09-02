return {
	-- which key, for checking keys
	{ "folke/which-key.nvim", lazy = true },

	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},

	-- rename?
	{
		"smjonas/inc-rename.nvim",
		enabled = false,
		config = true,
		keys = { { "<leader>rw", ":IncRename " } },
	},

	-- nvim surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- auto pairs / brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- fidget
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			progress = {
				display = {
					progress_icon = { pattern = "moon" },
				},
			},
			notification = {
				window = {
					relative = "editor", -- where to anchor, either "win" or "editor"
					winblend = 0, -- &winblend for the window
					border = "none", -- style of border for the fidget window
				}, -- options
			},
		},
		config = function()
			local fidget = require("fidget")
			vim.notify = fidget.notify
		end,
	},

	-- colorscheme : catppuccin
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	-- colorscheme : horizon
	{
		"akinsho/horizon.nvim",
		version = "*",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("horizon")
		end,
	},
	-- colorscheme : gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme('gruvbox')
		end,
	},

	-- colorscheme : nightfly
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- vim.cmd([[colorscheme nightfly]])
		end,
	},

	-- colorscheme : onedark
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			-- vim.cmd.colorscheme("onedark")
		end,
	},

	-- colorscheme : synthwave84
	{
		"lunarvim/synthwave84.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("synthwave84")
			vim.cmd.colorscheme("nightfly")
		end,
	},

	-- neo-tree / file manager
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal" },
		},
		opts = {
			filesystem = {
				window = {
					mappings = {
						["\\"] = "close_window",
					},
				},
			},
		},
	},

	-- nvim-telescope
	{

		"nvim-telescope/telescope.nvim",
		version = "0.1.5",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local keymap = vim.keymap
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					layout_strategy = "horizontal",
					disable_devicons = false,
					color_devicons = true,
					layout_config = { preview_cutoff = 100, width = 0.85 },
					prompt_prefix = "   ",
					selection_caret = " ",
					file_ignore_patterns = {
						"%git/",
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
						},
					},
				},
				pickers = {
					buffers = {
						sort_lastused = true,
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
				},

				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			telescope.load_extension("fzf")

			--                      [Keymaps]
			--      files and buffers
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" }) --find files
			keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Show old files" }) --olf files
			keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep" })
			keymap.set("n", "<leader>bu", builtin.buffers, { desc = "Show buffers" })

			--  help tags & man pages
			keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			keymap.set("n", "<leader>man", builtin.man_pages, { desc = "Show builtin man-pages" })
			keymap.set("n", "<leader>com", builtin.commands, { desc = "Show vim builtin commands" })

			-- git stuff
			keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
			keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Show git status" })

			--  view colorschemes
			keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Show available colorschemes" })
		end,
	},

	-- discord presence
	{

		"andweeb/presence.nvim",

		config = function()
			local presence = require("presence")

			presence.setup({
				auto_update = true,
				neovim_image_text = "I use vim btw",
				main_image = "file",
				log_level = nil,
				debounce_timeout = 10,
				enable_line_number = false,
				blacklist = {},
				buttons = true,
				file_assets = {},
				show_time = true,
				-- Rich Presence text options
				editing_text = "Editing %s",
				file_explorer_text = "Browsing %s",
				git_commit_text = "Committing changes",
				plugin_manager_text = "Managing plugins",
				reading_text = "Reading %s",
				workspace_text = "Working on %s",
				line_number_text = "Line %s out of %s",
			})
		end,
	},

	-- vimtex/ latex
	{
		"lervag/vimtex",
		enabled = true,
		config = function()
			vim.cmd([[
            filetype plugin indent on
            syntax enable

            let g:vimtex_view_method = 'zathura'
            let g:vimtex_view_general_viewer = 'zathura'
            let g:vimtex_view_general_options = '--unique file:@pdf\src:@line@tex'

            " VimTeX uses latexmk as the default compiler backend. If you use it, which is
            " strongly recommended, you probably don't need to configure anything. If you
            " want another compiler backend, you can change it as follows. The list of
            " supported backends and further explanation is provided in the documentation,
            " see ":help vimtex-compiler".

            let g:vimtex_compiler_method = 'latexmk'

            let g:vimtex_compiler_latexmk = {
                \ 'build_dir' : 'build',
                \}

                let g:vimtex_compiler_latexrun = {
                    \ 'build_dir' : 'build',
                    \}

                    let g:vimtex_quickfix_ignore_filters = [
                    \ 'Underfull',
                    \ 'Overfull',
                    \ 'Package subfig Warning',
                    \ 'Package balance Warning',
                    \]
                    let g:polyglot_disabled=['tex']
                    " Most VimTeX mappings rely on localleader and this can be changed with the
                    " following line. The default is usually fine and is the symbol "\".
                    let maplocalleader = ","


                    ]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		-- event = "VeryLazy",
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")

			lualine.setup({
				options = {
					icons_enabled = true,
					globalstatus = false,
					theme = "auto",
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{ "diff", colored = true },
						{
							"diagnostics",
							update_in_insert = true,
							symbols = { error = " " },
						},
					},
					lualine_c = { "filename", { "searchcount" } },
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e65" },
						},
						{
							function()
								local reg = vim.fn.reg_recording()
								if reg == "" then
									return ""
								end -- not recording
								return "recording@" .. reg
							end,
						},

						"encoding",
						"filetype",
						"fileformat",
					},
					lualine_y = {
						"progress",
					},
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", file_status = true, path = 1 } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fugitive", "nvim-tree" },
			})
		end,
	},
	-- wilder for terminal cmd
	{
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here

			local wilder = require("wilder")

			wilder.setup({
				modes = { ":", "/", "?" },
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
					-- 'single', 'double', 'rounded' or 'solid'
					max_height = "50%",
					min_height = "0",
					pumblend = 0,
					border = "rounded",
					prompt_position = "bottom",
					reverse = 0,
				}))
			)
		end,
	},
	--- multiple cursors
	{
		"jake-stewart/multicursor.nvim",
		config = function()
			local mc = require("multicursor-nvim")

			mc.setup()

			-- use MultiCursorCursor and MultiCursorVisual to customize
			-- additional cursors appearance
			vim.cmd.hi("link", "MultiCursorCursor", "Cursor")
			vim.cmd.hi("link", "MultiCursorVisual", "Visual")

			vim.keymap.set("n", "<esc>", function()
				if mc.hasCursors() then
					mc.clearCursors()
				else
					-- default <esc> handler
				end
			end)

			-- add cursors above/below the main cursor
			vim.keymap.set("n", "<up>", function()
				mc.addCursor("k")
			end)
			vim.keymap.set("n", "<down>", function()
				mc.addCursor("j")
			end)

			-- add a cursor and jump to the next word under cursor
			vim.keymap.set("n", "<c-n>", function()
				mc.addCursor("*")
			end)

			-- jump to the next word under cursor but do not add a cursor
			vim.keymap.set("n", "<c-s>", function()
				mc.skipCursor("*")
			end)

			-- add and remove cursors with control + left click
			vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
		end,
	},
}
