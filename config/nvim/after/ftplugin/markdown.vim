" https://habamax.github.io/2019/03/07/vim-markdown-frontmatter.html
function! MarkdownFold()
  let line = getline(v:lnum)

  " Regular headers
  let depth = match(line, '\(^#\+\)\@<=\( .*$\)\@=')
  if depth > 0
    return ">" . depth
  endif

  " Setext style headings
  " let prevline = getline(v:lnum - 1)
  " let nextline = getline(v:lnum + 1)
  " if (line =~ '^.\+$') && (nextline =~ '^=\+$') && (prevline =~ '^\s*$')
  "   return ">1"
  " endif

  " if (line =~ '^.\+$') && (nextline =~ '^-\+$') && (prevline =~ '^\s*$')
  "   return ">2"
  " endif

  " frontmatter
  if (v:lnum == 1) && (line =~ '^----*$')
	  return ">1"
  endif

  return "="
endfunction

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFold()

" fancy foldtext
function! MyFoldText()
	let line = getline(v:foldstart)

	" markdown frontmatter -- just take the next line hoping it would be
	" title: Your title
	if line =~ '^----*$'
		let line = getline(v:foldstart+1)
	endif

	let indent = max([indent(v:foldstart)-v:foldlevel, 1])
	let lines = (v:foldend - v:foldstart + 1)
	let strip_line = substitute(line, '^//\|=\+\|["#]\|/\*\|\*/\|{{{\d\=\|title:\s*', '', 'g')
	let strip_line = substitute(strip_line, '^[[:space:]]*\|[[:space:]]*$', '', 'g')
	let text = strpart(strip_line, 0, winwidth(0) - v:foldlevel - indent - 6 - strlen(lines))
	if strlen(strip_line) > strlen(text)
		let text = text.'…'
	endif
	return repeat('#', v:foldlevel) . repeat(' ', indent) . text .' ('. lines .')'
endfunction
set foldtext=MyFoldText()

" for markdown I prefer 2-wide tabs
setlocal tabstop=2 softtabstop=2 shiftwidth=2
