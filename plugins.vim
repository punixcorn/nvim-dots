" All the Plugins are listed here

call plug#begin("~/.vim/plugged")
    "for COC nvim going back, no need for lsp
      Plug 'neoclide/coc.nvim'

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

     "for asm
      Plug 'shirk/vim-gas'
      Plug 'mhartington/formatter.nvim'
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

      "snippets and completion
      Plug 'VonHeikemen/lsp-zero.nvim'
      Plug 'williamboman/mason.nvim'
      Plug 'williamboman/mason-lspconfig.nvim'
      "needed for auto completion
      Plug 'saadparwaiz1/cmp_luasnip'
      "snippets
      Plug 'L3MON4D3/LuaSnip'
      Plug 'rafamadriz/friendly-snippets'

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

" sourcing all the config files 
source ~/.config/nvim/plugins/barber.vim
source ~/.config/nvim/plugins/cmp.vim
source ~/.config/nvim/plugins/colorschemes.vim
source ~/.config/nvim/plugins/formatter.vim
source ~/.config/nvim/plugins/hexokinase.vim
source ~/.config/nvim/plugins/image_render.vim
source ~/.config/nvim/plugins/lualine.vim
source ~/.config/nvim/plugins/neotree.vim
source ~/.config/nvim/plugins/startup_screen.vim
source ~/.config/nvim/plugins/syntax_highlighting.vim
source ~/.config/nvim/plugins/taglist.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/toggle_term.vim
source ~/.config/nvim/plugins/vgit.vim
source ~/.config/nvim/plugins/vimtex.vim
source ~/.config/nvim/plugins/which_key.vim
