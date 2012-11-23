" vim: set ft=vim:

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

au FileType html,cheetah set ft=xml
au FileType html,cheetah set syntax=html

" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

iabbrev <buffer> aö <a href="«»" title="«»">«»</a>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> bö <b>«»</b>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> iö <i>«»</i>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> pö <p>«»</p><cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> tö <«»>«»</«»>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> tä <«»><cr>«»<cr></«»>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> imö <img src="«»" alt="«»" />«»<c-j><c-r>=Eatchar('\s')<cr>
