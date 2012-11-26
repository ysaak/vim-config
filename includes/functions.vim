""""""""""""""""""""
"    Functions     "
""""""""""""""""""""

command SmartMake :call SmartMake()

" Smart make
function! SmartMake()
	let s:tmux = system("echo $TMUX")

	if s:tmux != "\n"
		execute "VimuxRunLastCommand"
	elseif filereadable("Makefile") || filereadable("makefile")
		execute "!make"
	elseif (&ft == "tex")
		execute "!latex " . expand("%") . " && dvipdf " . expand("%:t:r") . ".dvi"
	elseif ($ft == "c")
		execute "!make " . expand("%")
	endif
endfunction

" Return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
