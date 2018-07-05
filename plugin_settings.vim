"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc - plugin settings
" by phaero - http://phaero.segolsson.se/
"
" Maintainer:	Johan Segolsson < johan dot segolssson at gmail dot com >
" Last Change: 2008-07-18 15:18
" 
" Sections:
" ----------------------
"	*> General
"	*> DoxygenToolkit
"	*> Yank ring
"	*> File explorer
"	*> Minibuffer
"	*> A.vim
"	*> Tag list (ctags)
"	*> Autotag
"	*> Pylint Compiler
"	*> Matchit
"	*> Tasklist
"	*> SrcExpl
"	*> FuzzyFinder
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


""""""""""""""""""""""""""""""
" => DoxygenToolkit
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_authorName="Johan Segolsson (qsegjoh)"
let g:DoxygenToolkit_briefTag_pre = ""
let g:DoxygenToolkit_paramTag_post = " «»"
let g:DoxygenToolkit_returnTag = "@return «»"

""""""""""""""""""""""""""""""
" => Vim Grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'

""""""""""""""""""""""""""""""
" => Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>
let g:yankring_persist = 0
let g:yankring_history_dir = '/tmp'

""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0

""""""""""""""""""""""""""""""
" => Tag list (ctags)
""""""""""""""""""""""""""""""
if !exists("TList_Ctags_Cmd")
	let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
let Tlist_Sort_Type = "name"
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
map <f4> :Tlist<cr>
"autocmd BufWritePost,FileWritePost * :silent TlistUpdate

""""""""""""""""""""""""""""""
" => A.vim
""""""""""""""""""""""""""""""
map <leader>A :A<cr>
map <leader>AS :AS<cr>
map <leader>AV :AV<cr>
map <leader>AT :AT<cr>
map <leader>AN :AN<cr>
map <leader>IHS :IHS<cr>
map <leader>IHV :IHV<cr>
map <leader>IHT :IHT<cr>

""""""""""""""""""""""""""""""
" => Pylint Compiler
""""""""""""""""""""""""""""""
let g:pylint_onwrite = 0

""""""""""""""""""""""""""""""
" => Matchit
""""""""""""""""""""""""""""""
source ~/.vim/plugin/matchit.vim

""""""""""""""""""""""""""""""
" => Tasklist
""""""""""""""""""""""""""""""
map <leader>L :TaskList<cr>

""""""""""""""""""""""""""""""
" => FuzzyFinder
""""""""""""""""""""""""""""""
nmap <leader>B :FufBuffer<cr>
nmap <leader>F :FufFile<cr>
nmap <leader>T :FufTag<cr>

" Rust.vim
let g:rustfmt_autosave = 1
