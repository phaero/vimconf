" Vim global plugin for using pyVim
" Last Change:	2008-05-12 10:31
" Maintainer:	Johan Segolsson <johan.segolsson@gmail.com>
" License:	LGPL

if exists( "loaded_pyvim" )
	finish
endif

let loaded_pyvim = 1

python << EOF
import logging

def update_path():
	'''
	Update the python path with possible pyvim directory's.
	'''
	import os
	import sys
	import vim

	# First add any pyvim directory's on the runtime path
	runtimepath = vim.eval( '&runtimepath' ).split( ',' )

	for path in runtimepath:
		pyvim_dir = os.path.join( path, 'pyvim' )

		if os.path.exists( pyvim_dir ):
			sys.path.append( pyvim_dir )

	# Add the current directory first in the sys.path if it doesn't exits
	if not sys.path[0] == '':
		sys.path.insert( 0, '' )

try:
	update_path()

	import pyvim.main

	manager = pyvim.main.PluginManager()
	manager.load()
except Exception, ex:
	logging.warning( 'Failed to load PyVim ( %s )', repr( ex ) )

EOF

" vim: set tw=78
