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
"	*> FlagIt
"	*> Yank ring
"	*> File explorer
"	*> Minibuffer
"	*> A.vim
"	*> Tag list (ctags)
"	*> Autotag
"	*> CCase
"	*> NERD_tree
"	*> NERD_commenter
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
" => FlagIt
""""""""""""""""""""""""""""""
map <leader>pe :FlagIt error<CR>
map <leader>pf :FlagIt favorite<CR>
map <leader>pi :FlagIt important<CR>
map <leader>pn :FlagIt info<CR>
map <leader>pp :FlagIt update<CR>
map <leader>pu :FlagIt urgent<CR>
map <leader>pw :FlagIt warning<CR>

map <leader>Pe :UnFlag error<CR>
map <leader>Pf :UnFlag favorite<CR>
map <leader>Pi :UnFlag important<CR>
map <leader>Pn :UnFlag info<CR>
map <leader>Pp :UnFlag update<CR>
map <leader>Pu :UnFlag urgent<CR>
map <leader>Pw :UnFlag warning<CR>

map <leader>Pa :UnFlag<CR>

let icons_path = $HOME."/.vim/icons/"
let g:Fi_Flags = {
			\ "error" : [icons_path."error.png", "XX", "true", "texthl=ErrorMsg linehl=ErrorMsg"],
			\ "favorite" : [icons_path."favorite.png", "! ", 0, "texthl=Underline"],
			\ "important" : [icons_path."important.png", "! ", 0, "texthl=Underline"],
			\ "info" : [icons_path."info.png", "! ", 0, "texthl=Normal"],
			\ "update" : [icons_path."update.png", "! ", 0, "texthl=MoreMsg"],
			\ "urgent" : [icons_path."urgent.png", "! ", 0, "texthl=Todo"],
			\ "warning" : [icons_path."warning.png", "! ", 0, "texthl=WarningMsg"],
			\ }
let g:Fi_OnlyText = 0
let g:Fi_ShowMenu = 1

""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 

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
" => CCase
""""""""""""""""""""""""""""""
" Don't load it by default
" let loaded_ccase = 1
let g:ccaseUseDialog=0 " Don't use dialog boxes

""""""""""""""""""""""""""""""
" => NERD_tree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos='left'
let g:NERDTreeIgnore=[ '\.pyc$', '\~$', 'CMakeFiles', 'CMakeCache\.txt', '\.pre-astyle$', 'cmake_install.cmake', '\.gcov$', '\.orig$', 'gcov.log' ]

map <f2> :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" => NERD_commenter
""""""""""""""""""""""""""""""
let g:NERDShutUp=1

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
