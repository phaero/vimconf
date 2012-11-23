" -*- vim -*-
" FILE: python_config.vim
" LAST MODIFICATION: 2008-10-23 10:05:55
" (C) Copyright 2008 Johan Segolsson <johan.segolsson@gmail.com>
" Version: 1.00

" USAGE:
"
" Save this file to $VIMFILES/ftplugin/python.vim. You can have multiple
" python ftplugins by creating $VIMFILES/ftplugin/python and saving your
" ftplugins in that directory. If saving this to the global ftplugin 
" directory, this is the recommended method, since vim ships with an
" ftplugin/python.vim file already.
"
" REQUIREMENTS:
" vim (>= 7)
"
" Shortcuts:
" 

" Only do this when not done yet for this buffer
if exists("b:python_config_ftplugin_loaded")
  finish
endif
let b:python_config_ftplugin_loaded = 1

" Use as much syntax highlighting as possible...
let python_highlight_all = 1

setlocal nosta
setlocal noet
setlocal smartindent

setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
