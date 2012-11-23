""""""""""""""""""""""""""""""
" => Snippets
"  This is just some old code that I didn't want to remove just yet, 
"  some of it will be removed and other will be added to other places.
"""""""""""""""""""""""""""""""
"	" This will be rewritten later...
"	" 
"	"You can use <c-j> to goto the next <++> - it is pretty smart ;)
"
"	"""""""""""""""""""""""""""""""
"	" => Python
"	"""""""""""""""""""""""""""""""
"	autocmd FileType python inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
"	autocmd FileType python inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
"	autocmd FileType python inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
"	autocmd FileType python inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
"	autocmd FileType python inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>
"
"
"	"""""""""""""""""""""""""""""""
"	" => JavaScript
"	"""""""""""""""""""""""""""""""
"	autocmd FileType cheetah,html,javascript inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
"	autocmd filetype cheetah,html,javascript inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
"	autocmd FileType cheetah,html,javascript inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
"	autocmd FileType cheetah,html,javascript inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
"
"
"	"""""""""""""""""""""""""""""""
"	" => Java
"	"""""""""""""""""""""""""""""""
"	autocmd FileType java inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("public<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
"	autocmd FileType java inorea <buffer> cfunpr <c-r>=IMAP_PutTextWithMovement("private<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
"	autocmd FileType java inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
"	autocmd FileType java inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
"	autocmd FileType java inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
"	autocmd FileType java inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++> <++> {\n<++>\n}")<cr>
"	autocmd FileType java inorea <buffer> cmain <c-r>=IMAP_PutTextWithMovement("public static void main(String[] argv) {\n<++>\n}")<cr>
"
"	
"	"""""""""""""""""""""""""""""""
"	" => C++
"	"""""""""""""""""""""""""""""""
"	fun! <SID>templates_cpp()
"		inorea <buffer> csi <c-r>=IMAP_PutTextWithMovement( "#include <<++>>\n<++>" )<cr>
"		inorea <buffer> cii <c-r>=IMAP_PutTextWithMovement( "#include \"<++>\"\n<++>" )<cr>
"		inorea <buffer> cfund <c-r>=IMAP_PutTextWithMovement( "<+ret+> <+name+>( <+args+> );\n<++>" )<cr>
"		inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement( "<+ret+> <+name+>( <+args+> )\n{\n<++>\n} // end func" )<cr>
"		inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++> ) {\n<++>\n} // end if\n<++>")<cr>
"		inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++> ) {\n<++>\n} else {\n<++>\n} // end if\n<++>")<cr>
"		inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++> ) {\n<++>\n} // end for\n<++>")<cr>
"		inorea <buffer> cwhile <c-r>=IMAP_PutTextWithMovement("while(<++> ) {\n<++>\n} // end while\n<++>")<cr>
"		inorea <buffer> cdo <c-r>=IMAP_PutTextWithMovement("do {\n<++>\n} while( <+cond+> );\n<++>")<cr>
"		inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement( "class<+name+>\n{\n<++>\n}; // end class" )<cr>
"		inorea <buffer> cclassi <c-r>=IMAP_PutTextWithMovement( "class<+name+> : <+base+>\n{\n<++>\n}; // end class" )<cr>
"		inorea <buffer> cmain <c-r>=IMAP_PutTextWithMovement("int main( int argc, char* argv[] )\n{\n<++>\n} // end main")<cr>
"	endfun
"	
"	autocmd FileType cpp :call <SID>templates_cpp()
"
"	"Press c-q instead of space (or other key) to complete the snippet
"	imap <C-q> <C-]>

