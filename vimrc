" File: .vimrc
" Author: Francois Clad
" Created: 4/01/2012
" Note: Based on a previous version from Xavier Oswald


""""""""""""""""""""
"     General      "
""""""""""""""""""""

call pathogen#infect()			" Enable Pathogen
call pathogen#helptags()
set term=xterm-256color			" Allows 256 colors themes and extended key mappings (e.g. SHIFT)
set nocompatible				" Use Vim settings, rather then Vi settings (much better!).
filetype plugin on				" load filetype plugins
filetype indent on				" load filetype indents
filetype on						" detect the type of file
set backspace=indent,eol,start	" more powerful backspacing
set completeopt=longest,menuone	" Completion list ordered by longest match
"set ofu=syntaxcomplete#Complete	" Turn on omni completion


""""""""""""""""""""
"   Theme/Colors   "
""""""""""""""""""""

syntax enable					" active coloration
set background=dark				" default background
colorscheme solarized			" coloration theme


""""""""""""""""""""
"  Files/Backups   " 
""""""""""""""""""""

set nobackup					" Turn backup off (use SVN, GIT or TimeMachine instead)
set nowb
try
	set directory=~/.vim/temp		" Set a directory for temp (swap) files
	set undodir=~/.vim/undo			" Unable persistent undo
	set undofile
catch
endtry


""""""""""""""""""""
"      Vim UI      "
""""""""""""""""""""

set ruler						" show the cursor position all the time
set cmdheight=2					" the command bar is 2 high
set hid							" you can change buffer without saving
set backspace=2					" make backspace work normal
set report=0					" tell us when anything is changed via :...
set ignorecase					" ignore case for searching
set mouse=a						" Enable mouse integration


""""""""""""""""""""
"   Visual Cues    " 
""""""""""""""""""""

set number						" Display line numbers
set showmatch					" show matching brackets
set mat=5						" how many tenths of a second to blink matching brackets for
set nohlsearch					" do not highlight searched for phrases
set incsearch					" BUT do highlight as you type you search phrase
set so=10						" Keep 10 lines (top/bottom) for scope
set novisualbell				" don't blink
set noerrorbells				" no noise
set showcmd						" display incomplete commands
set modeline					" display the current mode
set nostartofline				" keep the cursor in the same colon when changing line


""""""""""""""""""""
"   Status line    " 
""""""""""""""""""""
" Statusline setup
set statusline=%#DiffAdd#
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%#DiffAdd#
set statusline+=%f\
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{fugitive#statusline()}
set statusline+=%#DiffAdd# "switch back to normal
set statusline+=%= "left/right separator
set statusline+=%m "modified flag

" Display a warning if &paste is set
set statusline+=%#DiffChange#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%#DiffAdd# "switch to colors used for line number
set statusline+=%c: "cursor column
set statusline+=%l/%L "cursor line/total lines
"set statusline+=\ %P "percent through file
set laststatus=2

" Return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" Old status line
"set statusline=\ %F%m%r%h%w\ \ Type:\ %Y\ \ Line:\ %l/%L(%p%%)\ \ Column:\ %c\ 

set laststatus=2				" always show the status line



""""""""""""""""""""
"       Menu       " 
""""""""""""""""""""

set wildmenu					" menu completion


""""""""""""""""""""
" Text Formatting  " 
""""""""""""""""""""

set textwidth=75				" Set line width
set fo=tcrqn					" See Help (complex)
set ai							" autoindent
set si							" smartindent
set cindent						" do c-style identing
set tabstop=4					" tab spacing
set softtabstop=4				" 2 spaces when pressing <tab> unify
set shiftwidth=4				" unify
set noexpandtab					" real tabs please!
set smarttab					" use tabs at the start of a line, spaces elsewhere


""""""""""""""""""""
"   Key mapping    "
""""""""""""""""""""

" (Un)indent selected lines and keep highlighting
vnoremap	>			>gv
vmap		<TAB>		>
vnoremap	<			<gv
vmap		<S-TAB>		<

" Select all with Ctrl-A
nnoremap	<C-a>		ggVG
imap		<C-a>		<C-c><C-a>
vmap		<C-a>		<C-c><C-a>

" Undo with Ctrl-Z
nnoremap	<C-z>		u
imap		<C-z>		<C-o><C-z>
vmap		<C-z>		<C-c><C-z>

" Redo with Ctrl-R
"nnoremap	<C-r>		:redo<CR>
imap		<C-r>		<C-o><C-r>
vmap		<C-r>		<C-c><C-r>

" Save file with Ctrl-S
nnoremap	<C-s>		:w<CR>
imap		<C-s>		<C-o><C-s>
vmap		<C-s>		<C-c><C-s>

" Open a new tab with Ctrl-T
nnoremap	<C-t>		:tabnew<CR>
imap		<C-t>		<C-o><C-t>
vmap		<C-t>		<C-c><C-t>

" Manage windows with Ctrl-P
nnoremap	<C-p>		<C-w>
inoremap	<C-p>		<C-w>
vnoremap	<C-p>		<C-w>

" Close tab/window with Ctrl-W
nnoremap	<C-w>		:q<CR>
imap		<C-w>		<C-o><C-w>
vmap		<C-w>		<C-c><C-w>

" Make with F2
nnoremap	<F2>		:!make<CR>
imap		<F2>		<C-o><F2>
vmap		<F2>		<C-c><F2>

" Switch files in an MRU order with F3
nnoremap	<F3>		:LustyJuggler<CR>
imap		<F3>		<C-o><F3>
vmap		<F3>		<C-c><F3>

" Switch to source/header file with F4
nnoremap	<F4>		:A<CR>
imap		<F4>		<C-o><F4>
vmap		<F4>		<Esc><F4>

" Enable/disable spell checking with F5
nnoremap	<F5>		:set spell! spell?<CR>
imap		<F5>		<C-o><F5>
vmap		<F5>		<C-c><F5>

" Enable/disable search matches highlighting with F6
nnoremap	<F6>		:set hlsearch! hlsearch?<CR>
imap		<F6>		<C-o><F6>
vmap		<F6>		<C-c><F6>

" Highlight all occurences of the current word with F7
nnoremap	<F7>		:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
imap		<F7>		<C-o><F7>

" Toggle project
nmap <silent> <F8> <Plug>ToggleProject
imap		<F8>		<Esc><F8>
vmap		<F8>		<Esc><F8>

" Toggle tagbar
nnoremap	<F9>		:TagbarToggle<CR>
imap		<F9>		<Esc><F9>
vmap		<F9>		<Esc><F9>

" Move between windows with Shift and arrows
nnoremap	<S-Left>	:wincmd h<CR>
imap		<S-Left>	<C-c><S-Left>
vmap		<S-Left>	<C-c><S-Left>

nnoremap	<S-Right>	:wincmd l<CR>
imap		<S-Right>	<C-c><S-Right>
vmap		<S-Right>	<C-c><S-Right>

nnoremap	<S-Up>		:wincmd k<CR>
imap		<S-Up>		<C-o><S-Up>
vmap		<S-Up>		<C-c><S-Up>

nnoremap	<S-Down>	:wincmd j<CR>
imap		<S-Down>	<C-o><S-Down>
vmap		<S-Down>	<C-c><S-Down>

" Move 10 lines upper/lower with Alt and up/down arrows
noremap		<M-Up>		10<Up>
imap		<M-Up>		<C-o><M-Up>

noremap		<M-Down>	10<Down>
imap		<M-Down>	<C-o><M-Down>

" Move between words with Alt and left/right arrows
noremap		<M-Left>	b
imap		<M-Left>	<C-o><M-Left>

noremap		<M-Right>	e
imap		<M-Right>	<C-o><M-Right>

" Copy/paste integration with OS X clipboard
vnoremap	y			y:call system("pbcopy", getreg("\""))<CR>
"nnoremap	p			:call setreg("\"",system("pbpaste"))<CR>p

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Auto-completion mappings
inoremap	<expr> <CR>	pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


""""""""""""""""""""
"    Functions     "
""""""""""""""""""""

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

"""""""""""""""""""""""""""""""
" Load type specific settings "
"""""""""""""""""""""""""""""""

autocmd FileType tex	source ~/.vim/tex.vim

autocmd FileType c		set syntax=c.doxygen
autocmd FileType cpp	set syntax=cpp.doxygen

""""""""""""""""""""
"  Miscellaneous   "
""""""""""""""""""""

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

let g:LustyJugglerAltTabMode = 1

let g:DoxygenToolkit_authorName="Francois Clad"

let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'

"au bufNewFile *.lp 0r ~/.vim/templates/cplex.lp

