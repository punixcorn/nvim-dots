" Example config in VimScript
" NOTE: Configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
let g:github_function_style = "italic"
let g:github_comment_style = "italic"
let g:github_keyword_style = "NONE"
let g:github_variable_style = "NONE"

let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]
let g:transparent = "false" 
let g:dark_sidebar = "false"
let g:dark_float = "false"
let g:dev = "true"
" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme github_dark_default
"other are 
"github_light_colorbind
"github_light_default
"github_light
"github_dark_default
"github_dark_colorbind 
"github_dark 
"github_dimmed
"
