" vim: set ft=vim:

call LoadAbbrev('c')
autocmd FileType cpp set omnifunc=ccomplete#Complete

map <leader>dm ][%{j:Dox<cr>
map <leader>df gg:DoxAuthor<cr>

" Short snippets
iabbrev <buffer> cö class
iabbrev <buffer> ciö const_iterator
iabbrev <buffer> itö iterator
iabbrev <buffer> nsö namespace
iabbrev <buffer> piö private
iabbrev <buffer> poö protected
iabbrev <buffer> puö public
iabbrev <buffer> slö std::list
iabbrev <buffer> smö std::map
iabbrev <buffer> ssö std::string
iabbrev <buffer> svö std::vector
iabbrev <buffer> unö using namespace
