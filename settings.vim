" some basic settings
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
:inoremap <leader>] <Esc>
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
