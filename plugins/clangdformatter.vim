" clangd formater 
" llvm ,google, chromium, mozilla set using g:clang_format#style_options
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++17",
            \ "BreakBeforeBraces" : "Stroustrup"}

