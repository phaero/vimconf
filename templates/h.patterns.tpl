" vim: set ft=vim:

nmap <buffer> <Leader>g :!ctags *<cr>
autocmd FileType,BufEnter c set omnifunc=ccomplete#Complete
autocmd BufReadPost quickfix map <buffer> <silent> <cr> :.cc <cr> :ccl

nmap <buffer> <leader>cw :cw<cr>
nmap <buffer> <leader>cn :cn<cr>
nmap <buffer> <leader>cp :cp<cr>

" Short snippets
iabbrev <buffer> rö return «»;
iabbrev <buffer> rä return;
iabbrev <buffer> coö const
iabbrev <buffer> dö /**<cr><cr><backspace>*/<up>
iabbrev <buffer> vö virtual
iabbrev <buffer> tö typedef
iabbrev <buffer> iö #include <«»><cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> iä #include "«»"<cr>«»<c-j><c-r>=Eatchar('\s')<cr>

" Longer snippets
iabbrev <buffer> ifö if( «» ){<cr>«»<cr><backspace><backspace>}<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> foö for( «»; «»; «» ){<cr>«»<cr><backspace><backspace>}<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> whö while( «» ){<cr>«»<cr><backspace><backspace>}<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> doö do {<cr>«»<cr><backspace><backspace>} while( «» );<c-j><c-r>=Eatchar('\s')<cr>
