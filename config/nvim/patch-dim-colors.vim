function! s:patch_dim_colors()
    "###  GENERAL  ###########################################################
    highlight CursorLineNR ctermfg=7 ctermbg=8 cterm=bold
    highlight vertsplit ctermfg=8
    highlight MatchParen cterm=none ctermbg=5 ctermfg=15

    "###  LIGHTLINE  #########################################################
    " this is a modified version of the 16color colorscheme to fit my needs
    let s:black = [ '#000000', 0 ]
    let s:maroon = [ '#800000', 1 ]
    let s:green = [ '#008000', 2 ]
    let s:olive = [ '#808000', 3 ]
    let s:navy = [ '#000080', 4 ]
    let s:purple = [ '#800080', 5 ]
    let s:teal = [ '#008080', 6 ]
    let s:silver = [ '#c0c0c0', 7 ]
    let s:gray = [ '#808080', 8]
    let s:red = [ '#ff0000', 9 ]
    let s:lime = [ '#00ff00', 10 ]
    let s:yellow = [ '#ffff00', 11 ]
    let s:blue = [ '#0000ff', 12 ]
    let s:fuchsia = [ '#ff00ff', 13 ]
    let s:aqua = [ '#00ffff', 14 ]
    let s:white = [ '#ffffff', 15 ]

    let s:black = s:gray

    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
    let s:p.normal.left = [ [ s:white, s:blue ], [ s:white, s:gray ] ]
    let s:p.normal.middle = [ [ s:silver, s:black ] ]
    let s:p.normal.right = [ [ s:white, s:blue ], [ s:white, s:gray ] ]
    let s:p.normal.error = [ [ s:black, s:red ] ]
    let s:p.normal.warning = [ [ s:black, s:yellow ] ]
    let s:p.inactive.left =  [ [ s:silver, s:gray ], [ s:gray, s:black ] ]
    let s:p.inactive.middle = [ [ s:silver, s:black ] ]
    let s:p.inactive.right = [ [ s:silver, s:gray ], [ s:gray, s:black ] ]
    let s:p.insert.left = [ [ s:white, s:green ], [ s:white, s:gray ] ]
    let s:p.insert.right = copy(s:p.insert.left)
    let s:p.replace.left = [ [ s:white, s:red ], [ s:white, s:gray ] ]
    let s:p.replace.right = copy(s:p.replace.left)
    let s:p.visual.left = [ [ s:white, s:purple ], [ s:white, s:gray ] ]
    let s:p.visual.right = copy(s:p.visual.left)
    let s:p.tabline.left = [ [ s:silver, s:black ] ]
    let s:p.tabline.tabsel = copy(s:p.normal.right)
    let s:p.tabline.middle = [ [ s:silver, s:black ] ]
    let s:p.tabline.right = copy(s:p.normal.right)

    let g:lightline#colorscheme#dim#palette = lightline#colorscheme#flatten(s:p)

    "###  MARKDOWN SYNTAX  ###################################################
    " gruvbox markdown theme with standard terminal colors
    highlight markdownH1 ctermfg=2 cterm=bold
    highlight markdownH2 ctermfg=2 cterm=bold
    highlight markdownH3 ctermfg=3 cterm=bold
    highlight markdownH4 ctermfg=3 cterm=bold
    highlight markdownH5 ctermfg=3
    highlight markdownH6 ctermfg=3
    highlight markdownCode ctermfg=4
    highlight markdownCodeBlock ctermfg=4
    highlight markdownCodeDelimiter ctermfg=4
    highlight markdownBlockquote ctermfg=8
    highlight markdownListMarker ctermfg=8
    highlight markdownOrderedListMarker ctermfg=8
    highlight markdownRule ctermfg=8
    highlight markdownHeadingRule ctermfg=8
    highlight markdownUrlDelimiter ctermfg=5
    highlight markdownLinkDelimiter ctermfg=5
    highlight markdownLinkTextDelimiter ctermfg=5
    highlight markdownHeadingDelimiter ctermfg=1
    highlight markdownUrl ctermfg=1
    highlight markdownUrlTitleDelimiter ctermfg=1

    "###  SPELL CHECKING  ####################################################
    hi clear SpellBad
    hi SpellBad ctermfg=0 ctermbg=1
    hi clear SpellRare
    hi SpellRare ctermfg=0 ctermbg=1
    hi clear SpellCap
    hi SpellCap ctermfg=0 ctermbg=1
    hi clear SpellLocal
    hi SpellLocal ctermfg=0 ctermbg=1
endfunction
autocmd! ColorScheme dim call s:patch_dim_colors()
