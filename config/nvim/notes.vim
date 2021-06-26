function OpenNotesDir()
    exe "e " . g:notes_dir . "/refile.md"
endfunction

function NewNote()
    call OpenNotesDir()
    call feedkeys("Go- ")
endfunction

function NewAnnotation()
    let location = expand("%:p") . ":" . line(".")
    call OpenNotesDir()
    call feedkeys("Go-  [" . location . "]\<esc>0la")
endfunction

nmap gN :call OpenNotesDir()<CR>
nmap gM :call NewNote()<CR>
nmap gA :call NewAnnotation()<CR>


function InitNotesFile()
    " echomsg "loaded notes buffer"
    " it is super annoying that you cant set the cwd per buffer
    " and this is a really bad fix
    exe "nnoremap <buffer> <leader>f :Files " . g:notes_dir . "<CR>"
endfunction

augroup notes
    autocmd!
    exe "au BufEnter " . g:notes_dir . "/* call InitNotesFile()"
augroup END
