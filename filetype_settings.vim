"""""""""""""""""""""""""""""""
"  Filetype Specific Settings
"  This is just some old code that I didn't want to remove just yet, 
"  some of it will be removed and other will be added to other places.
"""""""""""""""""""""""""""""""
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"
"	""""""""""""""""""""""""""""""
"	" => VIM
"	""""""""""""""""""""""""""""""
"	autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
"
"
"	""""""""""""""""""""""""""""""
"	" => PHP section
"	""""""""""""""""""""""""""""""
"	autocmd FileType php compiler php
"	autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
"
"
"	""""""""""""""""""""""""""""""
"	" => Python section
"	""""""""""""""""""""""""""""""
"	"Run the current buffer in python - ie. on leader+space
"	au FileType python so <sfile>:h/scripts/python.vim
"	autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
"	autocmd FileType python so <sfile>:h/ftplugin/python_fold.vim
"
"	"Set some bindings up for 'compile' of python
"	autocmd FileType python compiler pylint
"	autocmd BufReadPost quickfix map <buffer> <silent> <cr> :.cc <cr> :ccl
"	autocmd FileType python nmap <leader>cw :cw<cr>
"	autocmd FileType python nmap <leader>cn :cn<cr>
"	autocmd FileType python nmap <leader>cp :cp<cr>
"	"autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"	"autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"
"	"Python iMaps
"	au FileType python set cindent
"	au FileType python inoremap <buffer> $r return
"	au FileType python inoremap <buffer> $s self
"	au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
"	au FileType python inoremap <buffer> $i import
"	au FileType python inoremap <buffer> $p print
"	au FileType python inoremap <buffer> $d """<cr>"""<esc>O
"
"	"Run in the Python interpreter
"	function! Python_Eval_VSplit() range
"		let src = tempname()
"		let dst = tempname()
"		execute ": " . a:firstline . "," . a:lastline . "w " . src
"		execute ":!python " . src . " > " . dst
"		execute ":pedit! " . dst
"	endfunction
"	au FileType python vmap <F6> :call Python_Eval_VSplit()<cr>
"
"	""""""""""""""""""""""""""""""
"	" => Cheetah section
"	"""""""""""""""""""""""""""""""
"	autocmd FileType cheetah set ft=xml
"	autocmd FileType cheetah set syntax=cheetah
"
"	"""""""""""""""""""""""""""""""
"	" => Vim section
"	"""""""""""""""""""""""""""""""
"	autocmd FileType vim set nofen
"
"	"""""""""""""""""""""""""""""""
"	" => Java section
"	"""""""""""""""""""""""""""""""
"	au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi
"
"	"Java comments
"	autocmd FileType java source ~/vim_local/macros/jcommenter.vim
"	autocmd FileType java let b:jcommenter_class_author='Johan Segolsson'
"	autocmd FileType java let b:jcommenter_file_author='Johan Segolsson'
"	autocmd FileType java map <buffer> <F2> :call JCommentWriter()<cr>
"
"	"Abbr'z
"	autocmd FileType java inoremap <buffer> $pr private
"	autocmd FileType java inoremap <buffer> $r return
"	autocmd FileType java inoremap <buffer> $pu public
"	autocmd FileType java inoremap <buffer> $i import
"	autocmd FileType java inoremap <buffer> $b boolean
"	autocmd FileType java inoremap <buffer> $v void
"	autocmd FileType java inoremap <buffer> $s String
"
"	"Folding
"	function! JavaFold()
"		setl foldmethod=syntax
"		setl foldlevelstart=1
"		syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"		syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold
"
"		function! FoldText()
"			return substitute(getline(v:foldstart), '{.*', '{...}', '')
"		endfunction
"		setl foldtext=FoldText()
"	endfunction
"	
"	au FileType java call JavaFold()
"	au FileType java setl fen
"
"	au BufEnter *.sablecc,*.scc set ft=sablecc
"
"	""""""""""""""""""""""""""""""
"	" => JavaScript section
"	"""""""""""""""""""""""""""""""
"	au FileType javascript so ~/vim_local/syntax/javascript.vim
"	function! JavaScriptFold()
"	  setl foldmethod=syntax
"	  setl foldlevelstart=1
"	  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"	  function! FoldText()
"		 return substitute(getline(v:foldstart), '{.*', '{...}', '')
"	  endfunction
"	  setl foldtext=FoldText()
"	endfunction
"	au FileType javascript call JavaScriptFold()
"	au FileType javascript setl fen
"
"	au FileType javascript imap <c-t> console.log();<esc>hi
"	au FileType javascript imap <c-a> alert();<esc>hi
"	au FileType javascript setl nocindent
"	au FileType javascript inoremap <buffer> $r return
"
"	au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
"	au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka
"
"
"	""""""""""""""""""""""""""""""
"	" => HTML
"	"""""""""""""""""""""""""""""""
"
"
"	""""""""""""""""""""""""""""""
"	" => C mappings
"	"""""""""""""""""""""""""""""""
"	autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>
"	
"	
"	""""""""""""""""""""""""""""""
"	" => C++ mappings
"	"""""""""""""""""""""""""""""""
"	fun! <SID>abbrev_cpp()
"		inoremap <buffer> jci const_iterator
"		inoremap <buffer> jcl class
"		inoremap <buffer> jco const
"		inoremap <buffer> jdx /**<CR><CR>/<Up>
"		inoremap <buffer> jit iterator
"		inoremap <buffer> jns namespace
"		inoremap <buffer> jpr protected
"		inoremap <buffer> jpu public
"		inoremap <buffer> jpv private
"		inoremap <buffer> jsl std::list
"		inoremap <buffer> jsm std::map
"		inoremap <buffer> jss std::string
"		inoremap <buffer> jsv std::vector
"		inoremap <buffer> jty typedef
"		inoremap <buffer> jun using namespace
"		inoremap <buffer> jvi virtual
"	endfun
"	
"	autocmd FileType cpp :call <SID>abbrev_cpp()
