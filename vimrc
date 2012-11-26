""""""""""""""""""""
"     General      "
""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Enable Pathogen
runtime bundle/pathogen/autoload/pathogen.vim	
call pathogen#infect()			" Enable Pathogen
call pathogen#helptags()

if has("unix")
	set term=xterm-256color			" Allow 256 colors themes and extended key mappings (e.g. SHIFT)
endif

filetype plugin on				" load filetype plugins
filetype indent on				" load filetype indents
filetype on						" detect the type of file
set backspace=indent,eol,start	" more powerful backspacing
set completeopt=longest,menuone	" Completion list ordered by longest match
set ofu=syntaxcomplete#Complete	" Turn on omni completion 
set wildmenu
set hidden
set enc=utf8


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
set cmdheight=1					" the command bar is 2 high
set hid							" you can change buffer without saving
set backspace=2					" make backspace work normal
set report=0					" tell us when anything is changed via :...
set ignorecase					" ignore case for searching
set mouse=a						" Enable mouse integration

if has("gui_running")
    set guioptions=egmrt
    set guifont=Monaco:h12
"    if has("win32")
"		" Windows specific stuff goes here
"		set guifont=Consolas\ for\ Powerline
"	elseif has("gui_macvim")
"		" MacVim (i.e. OSX) parameters
"		set guifont=Source\ Code\ Pro:h13
"	else
"		" Linux parameters
"		set guifont=Source\ Code\ Pro\ 9
"    endif
endif

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

set laststatus=2				" always show the status line

""""""""""""""""""""
" Text Formatting  " 
""""""""""""""""""""

"set textwidth=100				" Set line width
set colorcolumn=100
set fo=tcrqn					" See Help (complex)
set ai							" autoindent
set si							" smartindent
set cindent						" do c-style identing
set tabstop=4					" tab spacing
set softtabstop=4				" 2 spaces when pressing <tab> unify
set shiftwidth=4				" unify
set expandtab					" spaces for tabs please!


""""""""""""""""""""""""""""""""""""""""
" Include external configuration files "
""""""""""""""""""""""""""""""""""""""""

source ~/.vim/includes/functions.vim
source ~/.vim/includes/mapping.vim
source ~/.vim/includes/plugins.vim

"""""""""""""""""""""""""""""""
" Load type specific settings "
"""""""""""""""""""""""""""""""

"autocmd FileType tex	source ~/.vim/tex.vim
autocmd FileType tex    setl noai nocin nosi inde=
autocmd FileType tex    set textwidth=100				" Set line width
autocmd FileType tex	set spell
autocmd FileType tex    set spelllang=fr

autocmd FileType c		set syntax=c.doxygen
autocmd FileType cpp	set syntax=cpp.doxygen

"""""""""""""""
"  Folding   "
""""""""""""""

" Saving folds (Error free, see: http://ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds/)
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

" default fold level, all open, set it 200 or something
" to make it all closed.
set foldlevel=0

" Fold only the first level
set foldnestmax=1

autocmd FileType python		set foldmethod=indent
autocmd FileType c			set foldmethod=syntax
autocmd FileType cpp		set foldmethod=syntax
autocmd FileType php		set foldmethod=syntax
autocmd FileType java		set foldmethod=syntax

""""""""""""""""""""
"  Miscellaneous   "
""""""""""""""""""""

set grepprg=grep\ -nH\ $*
