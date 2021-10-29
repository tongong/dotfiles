" dim colorscheme
" originally from here: https://github.com/jeffkreeftmeijer/vim-dim
highlight clear

if exists("syntax_on")
    syntax reset
endif

" default-light.vim
highlight SpecialKey     ctermfg=4
highlight TermCursor     cterm=reverse
highlight NonText        ctermfg=12
highlight Directory      ctermfg=4
highlight ErrorMsg       ctermfg=15 ctermbg=1
highlight IncSearch      cterm=reverse
highlight MoreMsg        ctermfg=2
highlight ModeMsg        cterm=bold
highlight Question       ctermfg=2
highlight Title          ctermfg=5
highlight WarningMsg     ctermfg=1
highlight WildMenu       ctermfg=0 ctermbg=11
highlight Conceal        ctermfg=7 ctermbg=7
highlight SpellBad       ctermbg=9
highlight SpellRare      ctermbg=13
highlight SpellLocal     ctermbg=14
highlight PmenuSbar      ctermbg=8
highlight PmenuThumb     ctermbg=0
highlight TabLine        cterm=underline ctermfg=0 ctermbg=7
highlight TabLineSel     cterm=bold
highlight TabLineFill    cterm=reverse
highlight CursorColumn   ctermbg=7
highlight CursorLine     cterm=underline
highlight MatchParen     ctermbg=14
highlight Constant       ctermfg=1
highlight Special        ctermfg=5
highlight Identifier     cterm=NONE ctermfg=6
highlight Statement      ctermfg=3
highlight PreProc        ctermfg=5
highlight Type           ctermfg=2
highlight Underlined     cterm=underline ctermfg=5
highlight Ignore         ctermfg=15
highlight Error          ctermfg=15 ctermbg=9
highlight Todo           ctermfg=0 ctermbg=11

let colors_name = "dim"

" In diffs, added lines are green, changed lines are yellow, deleted lines are
" red, and changed text (within a changed line) is bright yellow and bold.
highlight DiffAdd        ctermfg=0    ctermbg=2
highlight DiffChange     ctermfg=0    ctermbg=3
highlight DiffDelete     ctermfg=0    ctermbg=1
highlight DiffText       ctermfg=0    ctermbg=11   cterm=bold

" Invert selected lines in visual mode
highlight Visual         ctermfg=NONE ctermbg=NONE cterm=inverse

" Highlight search matches in black, with a yellow background
highlight Search         ctermfg=0    ctermbg=11

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
if &background == "light"
    highlight LineNr       ctermfg=7
    highlight CursorLineNr ctermfg=8
    highlight Comment      ctermfg=7
    highlight ColorColumn  ctermfg=8    ctermbg=7
    highlight Folded       ctermfg=8    ctermbg=7
    highlight FoldColumn   ctermfg=8    ctermbg=7
    highlight Pmenu        ctermfg=0    ctermbg=7
    highlight PmenuSel     ctermfg=7    ctermbg=0
    highlight SpellCap     ctermfg=8    ctermbg=7
    highlight StatusLine   ctermfg=0    ctermbg=7    cterm=bold
    highlight StatusLineNC ctermfg=8    ctermbg=7    cterm=NONE
    highlight VertSplit    ctermfg=8    ctermbg=7    cterm=NONE
    highlight SignColumn                ctermbg=7
else
    highlight LineNr       ctermfg=8
    highlight CursorLineNr ctermfg=7
    highlight Comment      ctermfg=8
    highlight ColorColumn  ctermfg=7    ctermbg=8
    highlight Folded       ctermfg=7    ctermbg=8
    highlight FoldColumn   ctermfg=7    ctermbg=8
    highlight Pmenu        ctermfg=15   ctermbg=8
    highlight PmenuSel     ctermfg=8    ctermbg=15
    highlight SpellCap     ctermfg=7    ctermbg=8
    highlight StatusLine   ctermfg=15   ctermbg=8    cterm=bold
    highlight StatusLineNC ctermfg=7    ctermbg=8    cterm=NONE
    highlight VertSplit    ctermfg=7    ctermbg=8    cterm=NONE
    highlight SignColumn                ctermbg=8
endif


"###  CUSTOM ADDITIONS  ##################################################
"###  GENERAL  ###########################################################
highlight clear CursorLine
highlight CursorLineNR ctermfg=3 cterm=bold
highlight vertsplit ctermfg=8
highlight MatchParen cterm=none ctermbg=5 ctermfg=0
highlight clear SignColumn
highlight ColorColumn ctermfg=0 ctermbg=3

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
highligh clear SpellBad
highligh SpellBad ctermfg=0 ctermbg=1
highligh clear SpellRare
highligh SpellRare ctermfg=0 ctermbg=1
highligh clear SpellCap
highligh SpellCap ctermfg=0 ctermbg=1
highligh clear SpellLocal
highligh SpellLocal ctermfg=0 ctermbg=1
" make other errors less eye-hurting
highlight clear Error
highlight Error ctermfg=0 ctermbg=1
