"###  OPTIONS  ###############################################################
syntax on
filetype plugin on
set nocompatible

" 4 is the best tab size; change my mind
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set foldmethod=indent
set foldlevelstart=20

" interface
set number
set relativenumber
set colorcolumn=80
set signcolumn=yes
set noshowmode " not needed because of lightline statusline
set fillchars=eob:\ ,

" use persistent history.
" -> these are reset for /dev/shm to keep pass secure (see #autocommands)
if !isdirectory(expand("~/.vim/undo-dir"))
    call mkdir(expand("~/.vim/undo-dir"), "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
set nobackup
set noswapfile

" search
set incsearch
set nohlsearch
set ignorecase
set smartcase

set noerrorbells
set hidden " keep buffers open in background
set scrolloff=8
set updatetime=100 " for vim-gitgutter


"###  PLUGINS  ###############################################################
call plug#begin('~/.vim/plugged')

Plug 'ARM9/arm-syntax-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'axvr/zepl.vim'
Plug 'embear/vim-localvimrc'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

call plug#end()


"###  SETTINGS  ##############################################################
" colors
source $HOME/.config/nvim/patch-dim-colors.vim
colorscheme dim

" statusbar
let g:lightline = { 'colorscheme': 'dim', }

" spell check toggle
let g:myLangList = ["nospell", "de_de", "en_us"]
function! ToggleSpell()
    let b:myLang = b:myLang + 1
    if b:myLang >= len(g:myLangList) | let b:myLang = 0 | endif
    if b:myLang == 0
        setlocal nospell
    else
        execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
function! InitToggleSpell()
    if !exists("b:myLang")
        if &spell
            let b:myLang = index(g:myLangList, &spelllang)
        else
            let b:myLang = 0
        endif
    endif
endfunction

" zepl.vim
runtime zepl/contrib/python.vim  " enable the python contrib module.
let g:repl_config = {
            \   "javascript": { "cmd": "node" },
            \   "haskell": { "cmd": "ghci" },
            \   "scheme": { "cmd": "racket" },
            \   "python": {
            \     "cmd": "python",
            \     "formatter": function("zepl#contrib#python#formatter")
            \   }
            \ }

let g:notes_dir = $NOTES_DIR
source $HOME/.config/nvim/notes.vim

source $HOME/.config/nvim/init-private.vim

"###  REMAPS  ################################################################
let mapleader = " "
" without this gitgutter overwrites <leader>h... making <leader>h unusable
let g:gitgutter_map_keys = 0

nnoremap <leader>n :new .<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>v :BCommits<CR>
nnoremap <leader>g :G
nnoremap <leader>w :w<CR>
nnoremap <leader>r :Goyo<CR>
nnoremap <leader>s :call ToggleSpell()<CR>
nnoremap <leader>a ggVG
nnoremap <leader>R :source $MYVIMRC<CR>
" from LukeSmith's dotfiles
" Compile document, be it groff/LaTeX/markdown/etc.
nnoremap <leader>c :w! \| !compiler "<c-r>%"<CR>
" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout <c-r>%<CR><CR>
" switch to most recent file
nnoremap <leader><leader> <c-^>
" open repl
nnoremap <leader>z :bo 10 Repl<CR>
nnoremap Q gqq
" the ^ key is not reachable on qwertz keyboards
noremap 0 ^
nmap <return> za
nmap <leader><return> zR

nmap <Leader>ii <Plug>(GitGutterPreviewHunk)
nmap <Leader>is <Plug>(GitGutterStageHunk)
nmap <Leader>iu <Plug>(GitGutterUndoHunk)
nmap <Leader>io <Plug>(GitGutterNextHunk)

" fix gx (see https://github.com/vim/vim/issues/4738)
nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>

" exit terminal mode
tnoremap <Esc> <Esc><C-\><C-n>

" why would you use gf instead of gF?
nmap gf gF

" I always get these wrong
command! W w
command! Wq wq
command! WQ wq
command! Q q

noremap zj :call NextClosedFold('j')<cr>
noremap zk :call NextClosedFold('k')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction


"###  AUTOCOMMANDS  ##########################################################
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


" remember folding
set viewoptions=cursor,folds,slash,unix
source $HOME/.config/nvim/restore-view.vim

augroup main
    autocmd!
    autocmd BufWritePre         *           call TrimWhitespace()
    autocmd BufEnter            *           call InitToggleSpell()
    " clear colon commands
    autocmd CmdlineLeave        :           echo ''

    " filetypes
    autocmd BufRead,BufNewFile  *.md        setlocal filetype=markdown
    autocmd BufEnter            *.remark    setlocal syntax=markdown
    " do not keep history for pass
    autocmd BufEnter            /dev/shm/*  setlocal undofile&
    autocmd BufRead,BufNewFile  *.s,*.S     setlocal filetype=arm " = armv6/7
    autocmd FileType arm                    setlocal commentstring=//\ %s

    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window.
    autocmd InsertEnter         *           let w:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave         *           let &l:foldmethod=w:last_fdm
augroup END
