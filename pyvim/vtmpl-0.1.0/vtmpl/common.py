#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
common.py

Created by Johan Segolsson on 2009-03-01.
Copyright (c) 2009 . All rights reserved.
"""

import codecs
import commands
import os
import logging
import re

import vtmpl

# We don't have access to vim if this is run as a script
try:
	import vim
except ImportError:
	class Vim( object ): #pylint: disable-msg=R0903
		"""
		Dummy 'module' for vim.
		"""
		def eval( self, name ): #pylint: disable-msg=R0201
			"""
			Dummy function for vim.eval
			"""
			return name

	vim = Vim() # pylint: disable-msg=C0103

_LOG = logging.getLogger( vtmpl.NAME )

_EXPAND_TABLE = {
	'': commands.getoutput,
	'VIM': vim.eval,
	'PYTHON': eval,
}

_PATTERN = re.compile( r'''
	(\$\{(?P<type>\w*):(?P<cmd>.*?)\})
	|
	(\$(?P<name>\w+))
''', re.DOTALL | re.VERBOSE )

def load_template( fname ):
	"""
	Load or execute the template.
	"""
	fdata = None

	if fname.endswith( '.txt' ):
		try:
			_file = codecs.open( fname, 'r', 'utf-8' )
			fdata = _file.read()
		finally:
			_file.close()

		fdata = expand_variables( fdata )
	else:
		# Try to execute the template
		_LOG.debug( 'Trying to execute template.' )
		fdata = codecs.decode( commands.getoutput( fname ), 'utf-8' )
		fdata = expand_variables( fdata )

	return fdata

def expand_variables( fdata ):
	"""
	Expand all variables in fdata, a variable is defined by a $ followed by a
	word or a $ followed by { and }.
	"""
	def replace( match ):
		"""
		This function is called for each regex match in fdata and replaces the
		match.
		"""
		out = 'Undefined'

		if match.group( 'name' ):
			name = match.group( 'name' )

			if name in os.environ:
				out = os.environ[ name ]
			else:
				_LOG.warning( 'Failed to expand "%s".', name )

			_LOG.debug( 'Expanding "%s" to "%s".', name, out )
		elif match.group( 'cmd' ):
			_type, cmd = match.group( 'type' ), match.group( 'cmd' )

			try:
				out = str( _EXPAND_TABLE[ _type ]( cmd ) )
			except:
				_LOG.warning( 'Failed to expand "%s:%s".', _type, cmd ) #pylint: disable-msg=W0702

			_LOG.debug( 'Expanding "%s:%s" to "%s".', _type, cmd, out )

		return out

	fdata = re.sub( _PATTERN, replace, fdata )

	return fdata

