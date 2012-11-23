" vim: set ft=vim:

nmap <buffer> <Leader>g :!ctags --language-force=python *<cr>

autocmd FileType python set omnifunc=pythoncomplete#Complete

"Set some bindings up for 'compile' of python
autocmd FileType python compiler pylint
autocmd BufEnter *.py compiler pylint
autocmd BufReadPost quickfix map <buffer> <silent> <cr> :.cc <cr> :ccl

nmap <buffer> <leader>cw :cw<cr>
nmap <buffer> <leader>cn :cn<cr>
nmap <buffer> <leader>cp :cp<cr>

" Short snippets
iabbrev <buffer> rö return
iabbrev <buffer> sö self
iabbrev <buffer> cö ##<cr>#<space><cr>#<esc>kla
iabbrev <buffer> iö import
iabbrev <buffer> iä from «» import «»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> pö print
iabbrev <buffer> dö """<cr>«»<cr>"""<c-j><c-r>=Eatchar('\s')<cr>

" Longer snippets
iabbrev <buffer> ifö if «»:<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> foö for «» in «»:<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> whö while «» in «»:<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> teö try:<cr>«»<cr>except:<cr>«»<cr><c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> teä try:<cr>«»<cr>except «»:<cr>«»<cr><c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> tfö try:<cr>«»<cr>finally:<cr>«»<cr><c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> dfö def «»( «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> dfä def «»():<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> dcö def «»( self, «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> dcä def «»( self ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> diö def __init__( self ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> diä def __init__( self, «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> clö class «»( object ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> clä class «»( «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> ldö log.debug( «» )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> liö log.info( «» )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> leö log.error( «» )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> leä log.exception( «» )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> lwö log.warning( «» )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> maö import sys<cr><cr>def main( args ):<cr>«»<cr><backspace><cr>if __name__ == '__main__':<cr>main( sys.argv[1:] )<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> classö class «»( object ):<cr>def __init__( self, «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> classä class «»( «» ):<cr>def __init__( self, «» ):<cr>«»<c-j><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> aparserö def setup_parser():<cr>from optparse import OptionParser<cr>parser = OptionParser()<cr><cr>«»<cr><cr>return parser<c-j><c-r>=Eatchar('\s')<cr>
