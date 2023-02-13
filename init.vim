call plug#begin("~/.vim/plugged")
"for color codes
 Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

"for finding files
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'

 "for doucment editing
 Plug 'lfilho/cosco.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'lervag/vimtex'
 Plug 'chrisbra/csv.vim'

 "for the bottom taskbar
 Plug 'nvim-lualine/lualine.nvim'

 "for tag
 Plug 'yegappan/taglist'

 "dev icons
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'ryanoasis/vim-devicons'

 "error checking
 Plug 'dense-analysis/ale'

 "Auto code formattin
 Plug 'folke/which-key.nvim' "Key Suggestions
 "for asm "
 Plug 'shirk/vim-gas'
"Plug 'google/vim-maktaba'
 Plug 'mhartington/formatter.nvim'
  "Plug 'google/vim-codefmt'
 "Plug 'google/vim-glaive'
 "Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'jose-elias-alvarez/null-ls.nvim'
 "completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

 "Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

 "For vsnip users. => completion
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  """""""""""""""""""""experimental
  Plug 'VonHeikemen/lsp-zero.nvim'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  "needed for auto completion
  Plug 'saadparwaiz1/cmp_luasnip'
  "snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'
 """""""""""""""""""""end of experimental
 "for auto brackets
 Plug 'jiangmiao/auto-pairs'

 "asm
 Plug 'shirk/vim-gas'

 "nvim tree (tab)
 Plug 'nvim-tree/nvim-tree.lua'

 "theme
 Plug 'dracula/vim'
 Plug 'EdenEast/nightfox.nvim'
 Plug 'morhetz/gruvbox'

 "auto comment
 Plug 'preservim/nerdcommenter'

 "for syntax highlighting
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


 "for startup
 Plug 'startup-nvim/startup.nvim'
 "others
 Plug 'declancm/cinnamon.nvim' " Smooth Scrolling
 Plug 'kyazdani42/nvim-web-devicons' " Status Bar Icons
 Plug 'folke/trouble.nvim' " Error box
 Plug 'tanvirtin/vgit.nvim' " Git changes in gutter
 Plug 'akinsho/toggleterm.nvim' " Better Built-in Terminal
 Plug 'numToStr/Comment.nvim' " Comment Key
 Plug 'romgrk/barbar.nvim' "Tabs
 Plug 'xiyaowong/nvim-transparent' " Transparent Background
 Plug 'rcarriga/nvim-notify' " Notification Boxes

 " Tools
 Plug 'wakatime/vim-wakatime' " Time Logging
 Plug 'manzeloth/live-server' " Live Server
 Plug 'sbdchd/neoformat' " Auto formatter
 Plug 'kdheepak/lazygit.nvim' " Lazygit
 Plug 'frabjous/knap' " Latex & Markdown Viewer
 Plug 'stevearc/dressing.nvim' " Icon Picker Dep
 Plug 'ziontee113/icon-picker.nvim' " Icon Picker
 Plug 'preservim/tagbar' " Tagbar for code navigation
 Plug 'andweeb/presence.nvim' " Discord RPC
 Plug 'samodostal/image.nvim' " Image Viewer
 Plug 'm00qek/baleia.nvim', { 'tag': 'v1.2.0' }

call plug#end()

"_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"start of congfig
"_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Lualine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END

require('lualine').setup {
	options = {
			component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
			disabled_filetypes = { "NvimTree", "alpha", "dashboard", "Outline" }
		},
	sections = {
		lualine_b = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn' },
				symbols = {error = " ", warn = " ", info = " ", hint = " " },
				always_visible = true
			}
		},
		lualine_x = {"location", "filetype"}
		}
	}
END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"formatter.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

EOF
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nvim tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << END
-- disable default file handler
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- start nvimtree
require'nvim-tree'.setup({
    filters = {
        dotfiles = true
    }
})
END
"mapping
nnoremap <c-n> <cmd>NvimTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"which-key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('which-key').setup {
    window = {
	    border = "rounded",
		margin = { 1, 1, 1, 1 }
	    }
	}
END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cmp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set completeopt=menu,menuone,noselect

lua<<EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'clangd',
--'bash-language-server',
--  'asm-lsp',
--  'cmake-language-lsp',
--  'css-lsp',
--  'html-lsp',
--  'json-lsp',
  'pyright',
  'rust_analyzer',
--  'dockerfile-language-server'
})
lsp.nvim_workspace()
lsp.setup()
EOF
"old
lua<<EOF
--[[
-- Icons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "ﰮ",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "﬌",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "ﬦ",
  TypeParameter = "",
}

-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
    },mapping = {
       ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      --elseif has_words_before() then
      --  cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    },
	formatting = {
		fields = {"kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "",
				luasnup = "",
				buffer = "",
				path = "",
			})[entry.source.name]
			return vim_item
		end,
		},
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'buffer' },
    }, {
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
   require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['eslint'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['hls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['quick_lint_js'].setup {
      capabilities = capabilities
  }
  require('lspconfig')['jsonls'].setup {
      capabilities = capabilities
  }
--]]
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Toggle term
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require("toggleterm").setup({
    float_opts = {
        border = 'curved'
    }
})

local Terminal = require("toggleterm.terminal").Terminal
local nap = Terminal:new({
    cmd = 'nap',
    direction = 'float',
    close_on_exit = true
})

function _nap_toggle()
    nap:toggle()
end

END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"startup screen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua<<EOF
     require("startup").setup({theme = "dashboard"})
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua<<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
 -- ensure_installed = { "bash", "python", "javascript","c", "lua", "rust" , "cpp" },
    ensure_installed = "all",
-- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorschemes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
" pick one and uncomment replace in colorscheme <theme>
"carbonfox
"nightfox
"terafox
"nordfox
"duskfox
"evening
"dracula
"grubox
"dessert
"blue
"dark-blue
"dawnfox
"elflord
"slate
"let g:gruvbox_transparent_bg=1
colorscheme slate
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :VimtexTocToggle<CR>
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Package subfig Warning',
      \ 'Package balance Warning',
      \]



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-t> :TlistToggle<CR>
nnoremap <silent><F12> :TlistUpdate<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nvim configs and keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lazygit keybind
nnoremap <leader>lg <CMD>LazyGit<CR>

" ToggleTerm
nnoremap <C-\> <CMD>ToggleTerm<CR>
nnoremap <leader>n <CMD>lua _nap_toggle()<CR>

" QoL Terminal Commands
tnoremap <ESC> <C-\><C-n>
tnoremap <C-\> <C-\><C-n><CMD>ToggleTerm<CR>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" Icon Picker
nnoremap <leader>i <CMD>IconPickerNormal<CR>

set splitright
set splitbelow

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
"set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                 " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check  )
set noswapfile            " disable creating swap file
set nobackup                " Directory to store backup files.
"set guicursor=a:blinkon100  "Blinking cursor
set updatetime=300          "fix long update times



 "move line or visually selected block - alt+j/k
 inoremap <A-j> <Esc>:m .+1<CR>==gi
 inoremap <A-k> <Esc>:m .-2<CR>==gi
 vnoremap <A-j> :m '>+1<CR>gv=gv
 vnoremap <A-k> :m '<-2<CR>gv=gv

 "move split panes to left/bottom/top/right
 nnoremap <A-h> <C-W>H
 nnoremap <A-j> <C-W>J
 nnoremap <A-k> <C-W>K
 nnoremap <A-l> <C-W>L
 "move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

"  Press i to enter insert mode, and ii to exit insert mode.
":inoremap ii <Esc>
":inoremap jk <Esc>
":inoremap kj <Esc>
":vnoremap jk <Esc>
":vnoremap kj <Esc>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=/home/potatojs/.config/nvim/undodir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.css Neoformat
autocmd BufWritePre *.html Neoformat
autocmd BufWritePre *.hs Neoformat
autocmd BufWritePre *.rs Neoformat
autocmd BufWritePre *.md Neoformat
autocmd BufWritePre *.yml Neoformat
autocmd BufWritePre *.json Neoformat
autocmd BufWritePre *.py Neoformat
autocmd BufWritePre *.go Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.java Neoformat
autocmd BufWritePre *.c Neoformat
autocmd BufWritePre *.cpp Neoformat

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Transparent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
--require('transparent').setup({
--	enable = true,
--	})
END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"baber nvim for moving around tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"interferes with my line movement keybindingpour
 "Move to previous/next
 nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
 nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
 " Re-order to previous/next
 nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
 nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
 nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
 nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
 nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
 nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
 nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
 nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
 nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
 nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
 nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
 nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

 " Close buffer
 nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
 let bufferline = get(g:, 'bufferline', {})
 let bufferline.no_name_title = 'New Tab'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorcodes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" type
let g:Hexokinase_highlighters = ['backgroundfull']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for rendering images
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('image').setup {
  render = {
    min_padding = 5,
    show_label = true,
    use_dither = true,
    foreground_color = true,
    background_color = true
  },
  events = {
    update_on_nvim_resize = true,
  },
}
END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vgit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('vgit').setup({
settings = {
    live_blame = {
      enabled = false
    }
  }
})

vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'
END
