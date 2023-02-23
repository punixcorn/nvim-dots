" All the Plugins are listed here

call plug#begin("~/.vim/plugged")
    "for COC nvim going back, no need for lsp
     Plug 'neoclide/coc.nvim',{ 'branch':'release' }
    " Or build from source code by using yarn: https://yarnpkg.com > if you
    " get errrors about coc -> do yarn install , comment the top one and
    " uncomment this 
    " Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
     Plug 'rhysd/vim-clang-format'

    "for color codes
      Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    "for finding files
      Plug 'nvim-lua/plenary.nvim'
      Plug 'nvim-telescope/telescope.nvim',{ 'tag' : '0.1.1'}
      Plug 'nvim-telescope/telescope-file-browser.nvim'
      Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

     " error checking
     " Plug 'dense-analysis/ale'
     
     " Key Suggestions
      Plug 'folke/which-key.nvim' 

     "for asm
      Plug 'shirk/vim-gas'
      Plug 'mhartington/formatter.nvim'
      Plug 'jose-elias-alvarez/null-ls.nvim'

      "Markdown
      Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

      "for auto brackets
      Plug 'jiangmiao/auto-pairs'

     "nvim tree (tab)
      Plug 'nvim-tree/nvim-tree.lua'

     "theme
      Plug 'dracula/vim'
      Plug 'EdenEast/nightfox.nvim'
      Plug 'morhetz/gruvbox'
      Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }

     "auto comment
      Plug 'preservim/nerdcommenter'

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
      Plug 'wakatime/vim-wakatime' " Time Logging and other stuff 
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
"source ~/.config/nvim/plugins/cmp.vim
source ~/.config/nvim/plugins/colorschemes.vim
"source ~/.config/nvim/plugins/formatter.vim
source ~/.config/nvim/plugins/hexokinase.vim
source ~/.config/nvim/plugins/image_render.vim
source ~/.config/nvim/plugins/lualine.vim
source ~/.config/nvim/plugins/neotree.vim
source ~/.config/nvim/plugins/startup_screen.vim
source ~/.config/nvim/plugins/syntax_highlighting.vim
source ~/.config/nvim/plugins/taglist.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/telescope_findfile.vim
source ~/.config/nvim/plugins/toggle_term.vim
source ~/.config/nvim/plugins/vgit.vim
source ~/.config/nvim/plugins/vimtex.vim
source ~/.config/nvim/plugins/which_key.vim
source ~/.config/nvim/plugins/nvimcoc.vim
source ~/.config/nvim/plugins/clangdformatter.vim
source ~/.config/nvim/plugins/githubtheme.vim
