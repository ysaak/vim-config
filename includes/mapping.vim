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

" Make with F2
nnoremap	<F2>		:!SmartMake<CR>
imap		<F2>		<C-o><F2>
vmap		<F2>		<C-c><F2>

" Switch files in an MRU order with F3
nnoremap	<F3>		:LustyJuggler<CR>
imap		<F3>		<C-c><F3>
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
