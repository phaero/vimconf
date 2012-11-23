"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" by phaero - http://phaero.segolsson.se/
" 
"	In large part inspired by ( if not copied ) by:
"		 Amir Salihefendic <amix3k at gmail.com> vimrc at:
"			  http://www.amix.dk/vim/vimrc.html
"		 Ciaran McCreesh vimrc at:
"			  http://ciaranm.org/vimrc
"
" Maintainer:	Johan Segolsson < johan dot segolssson at gmail dot com >
" Last Change: 2008-07-18 15:18
" 
" Sections:
" ----------------------
"	*> General
"	*> Colors and Fonts
"	*> Fileformats
"	*> VIM userinterface
"	*> Statusline
"	*> Visual
"	*> Moving around and tabs
"	*> General Autocommands
"	*> Parenthesis/bracket expanding
"	*> General Abbrevs
"	*> Editing mappings etc.
"	*> Command-line config
"	*> Buffer related
"	*> Files and backups
"	*> Folding
"	*> Text options
"	*> Indent
"	*> Spell checking
"	*> Plugin configuration
"	*> Filetype generic
"	*> Filetype Specific Settings
"	*> Snippets
"	*> Cope
"	*> MISC
"
"  Tip:
"	If you find anything that you can't understand than do this:
"	help keyword OR helpgrep keywords
"  Example:
"	Go into command-line mode and type helpgrep nocompatible, ie.
"	:helpgrep nocompatible
"	then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode..
set nocompatible

" Turn of timeouts
"set notimeout 
set timeoutlen=1000
set ttimeout 
set ttimeoutlen=100

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Have mouse enabled all the time
set mouse=a

" Set mapleader
let mapleader=","
let g:mapleader=","

let g:Context="Default"

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" Fast reloading of the .vimrc
map <leader>s :source ~/.vim/vimrc<cr>
" Fast editing of .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>
" Fast editing of todo file
map <leader>E :e! ~/.vim/TODO<cr>
" When .vimrc is edited, reload it
"autocmd! bufwritepost vimrc source ~/projects/vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlightning
syntax enable

" Set font
if MySys() == "linux"
	"set gfn=Bitstream\ Vera\ Sans\ Mono\ Bold\ 10
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
	set guifontset=Bitstream\ Vera\ Sans\ Mono\ 10
	set guifontwide=Bitstream\ Vera\ Sans\ Mono\ 10
else
	set gfn=Monospace\ Bold\ 10
	set guifontset=Monospace\ Bold\ 10
	set guifontwide=Monospace\ Bold\ 10
endif

set background=dark
if has( "gui_running" )
	set guioptions=
	colorscheme wombat
else
	colorscheme wombat
endif

" Some nice mappings to switch syntax ( useful if one mixes different 
" languages in one file )
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=text<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

" Highlight current line
set cursorline
if has( "gui_running" )
	set cursorcolumn
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Favorite filetypes
set ffs=unix,dos,mac

" Set default encoding
set encoding=utf-8
set termencoding=utf-8

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" Setup Markdown syntax
augroup mkd
	autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursors - when moving vertically
set so=7

" Turn on Wild menu
set wildmenu

" Make it behave like a shell
" set wildmode=list:longest

" Always show current position
set ruler

" The commandbar is 1 high
set cmdheight=1

" Show the command we are writing
set showcmd

" Show line numbers
set nu

" Do not redraw, when running macros.. lazy redraw
set lz

" Change buffer - without saving
set hidden

" Set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Set magic on
set magic

" Don't set the title in a xterm
set notitle

" Remove annoying messages
set shortmess=atI

" No sound on errors
set novb
set t_vb=
set noerrorbells
"set novisualbell
"autocmd GUIEnter * set novisualbell t_vb=

" show matching bracets
set showmatch

" How many tenths of a second to blink
set mat=2

" Ignore case when searching
set ignorecase
set incsearch
set infercase

" Highlight search things
set hlsearch

" Show full tags when doin search completion
set showfulltag

" Scroll 3 line down/up when cursor moves outside the current viewport
set scrolloff=3

" Change so that 'a takes you to the correct line and column and `a takes you
" to the correct line.
nnoremap ' `
nnoremap ` '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always hide the status line
set laststatus=2

function! CurDir()
	let curdir = substitute( getcwd(), '/home/phaero/', "~/", "g" )
	return curdir
endfunction

" Format the statusline
set statusline=
set statusline+=%<%F%h%m%r%h%w%y
set statusline+=\ %{&ff}
set statusline+=\ %{strftime(\"%Y-%m-%d\ %H:%M\")}
set statusline+=%=\ c:%c%V
set statusline+=\ a:%b\ p:%o
set statusline+=\ l:%l\,%L\ %P

" set statusline+=%=\ col:%c%V
" set statusline+=\ ascii:%b\ pos:%o
" set statusline+=\ lin:%l\,%L\ %P

" Old status line
" set statusline=
" set statusline+=%-3.3n\ 						" Buffer
" set statusline+=%f\ 							" filename
" set statusline+=%h%m%r%w						" flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}, 	" Filetype
" set statusline+=%{&encoding}, 				" Encoding
" set statusline+=%{&fileformat}]\ \  			" Fileformat
" set statusline+=CWD:\ %r%{CurDir()}%h
" set statusline+=%= 							" Right align
" set statusline+=0x%-8B\  						" Current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P 		" Offset

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"
	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute( l:pattern, "\n$", "", "" )
	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	else
		execute "normal /" . l:pattern . "^M"
	endif
	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> # :call VisualSearch('b')<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / and c-space to ?
map <space> /
map <c-space> ?

" Actually, the tab doesn't switch buffers, but my arrows 
" BClose function can be found in "Buffer related" section
map <leader>bd :Bclose<cr>

" Tab configuration
map <leader>fh :tabnew<cr>
map <leader>fH :tabnew<cr>:NERDTreeToggle<cr>:Tlist<cr><c-w>l
map <leader>fe :tabedit
map <leader>fc :tabclose<cr>
map <leader>fm :tabmove
map <leader>fp :tabprev<cr>
map <leader>fn :tabnext<cr>

try
	set switchbuf=usetab
	set stal=2
catch
endtry

" Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch to current dir
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap §1 <esc>`>a)<esc>`<i(<esc>
vnoremap §2 <esc>`>a]<esc>`<i[<esc>
vnoremap §3 <esc>`>a}<esc>`<i{<esc>
vnoremap §$ <esc>`>a"<esc>`<i"<esc>
vnoremap §q <esc>`>a'<esc>`<i'<esc>
vnoremap §w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap §1 (  )«»<esc>:let leavechar=")"<cr>3hi
inoremap §2 [  ]«»<esc>:let leavechar="]"<cr>3hi
inoremap §3 {  }«»<esc>:let leavechar="}"<cr>3hi
inoremap §4 {<esc>o}«»<esc>:let leavechar="}"<cr>O
inoremap §q ''«»<esc>:let leavechar="'"<cr>2hi
inoremap §w ""«»<esc>:let leavechar='"'<cr>2hi
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My information
iab xdate <c-r>=strftime("%Y-%m-%d %T")<cr>
iab xname Johan Segolsson


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

func! StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position
	let _s=@/
	let l = line(".")
	let c = line(".")
	
	" Do the business:
	%s/\s\+$//e
	
	" Cleanup: restore previous search history, and cursor position
	let @/=_s
	call cursor(l,c)
endfunc

"autocmd BufWrite *.py :call DeleteTrailingWS()

set completeopt=menu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
	let cwd = getcwd()
	return "e " . cwd 
endfunc

func! DeleteTillSlash()
	let g:cmd = getcmdline()
	if MySys() == "linux" || MySys() == "mac"
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	endif
	if g:cmd == g:cmd_edited
		if MySys() == "linux" || MySys() == "mac"
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		 else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		endif
	endif
	return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>	 <Home>
cnoremap <C-E>	 <End>
cnoremap <C-K>	 <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :Sscratch<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd BufEnter * lcd %:p:h

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
set nosta
set noet
set shiftwidth=4
set tabstop=4

map <leader>t2 :set shiftwidth=2 tabstop=2<cr>
map <leader>t3 :set shiftwidth=3 tabstop=3<cr>
map <leader>t4 :set shiftwidth=4 tabstop=4<cr>
map <leader>t8 :set shiftwidth=8 tabstop=8<cr>
map <leader>ts :set sta et<cr>
map <leader>tt :set nosta noet<cr>

" Don't remove indent even if I don't write anything on that line
imap <cr> <cr> <bs>

" Highlight whitespace
if has( "gui_running" )
	set listchars=eol:↓,tab:»\ ,trail:.,extends:…
else
	set listchars=eol:$,tab:>-,trail:.
endif
set list

" Don't make # force column 0
au FileType python,bash inoremap # X<bs>#

set lbr
set tw=0
map <leader>tW :set tw=100<cr>
map <leader>tw :set tw=0<cr>

" Help with completion
set dictionary=/usr/share/dict/words

" set up some more useful digraphs
digraph ., 8230	 " ellipsis (…)

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
"set cindent
set smartindent

"Wrap lines
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nospell
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete a buffer but keep layout
command! Kwbd enew|bw #

nmap <silent> <f3> :silent nohlsearch<cr>
imap <silent> <f3> <c-o>:silent nohlsearch<cr>
nmap <f5> <c-w>c
nmap <F7> :so %<CR>
nmap <F8> :make<CR>
nmap <F11> <C-]>
nmap <F12> :pop<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/plugin_settings.vim
	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all characters after column 100
"au BufEnter *   if &textwidth > 0 | exec 'match Todo /\%>' . &textwidth . 'v.\+/' | endif

function! Eatchar(pat)
	let c = nr2char(getchar(0))
	return ( c =~ a:pat ) ? '' : c
endfunction

function! LoadAbbrev(extension)
	silent! :execute 'source ~/.vim/templates/'. a:extension .'.patterns.tpl'
endfunction

autocmd BufRead * silent! :call LoadAbbrev('%:e')

" Add a quick command to replace « » marks
nnoremap <c-j> /«»<cr>c/»/e<cr>
inoremap <c-j> <ESC>/«»<cr>c/»/e<cr>
match TODO /«»/

"""""""""""""""""""""""""""""""
" => Filetype Specific Settings
"""""""""""""""""""""""""""""""
source ~/.vim/filetype_settings.vim

""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""
source ~/.vim/snippets_settings.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
"map <silent> <leader><cr> :noh<cr>

"Orginal for all
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>
"map <leader>c :botright cw 10<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<f2>

"Remove indenting on empty lines
"map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
inoremap <leader>v <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" Print fullpath
fun! PrintFullPath()
    exe ":echomsg expand('%:p:h')"
endfun

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
" Link
" Anchor
function! SmartTOHtml()
	TOhtml
	try
		%s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
		%s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
		%s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
	catch
	endtry
	exe ":write!"
	exe ":bd"
endfunction

" TOhtml customization
let html_number_lines = 0
let use_xhtml = 1
let html_use_css = 1
