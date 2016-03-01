#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
This module contains a Plugin for PyVim.
"""

import codecs
import os
import logging

import vim
import pyvim.plugin as plugin

import vtmpl
import vtmpl.common as common

_LOG = logging.getLogger( vtmpl.NAME )

class TemplateManager( plugin.Plugin ):
	"""
	This is the basic TemplateManager plugin which hooks into vim by
	registering some commands and callbacks.
	"""

	def __init__( self, plugin_manager ):
		"""
		Standard constructor.
		"""
		super( TemplateManager, self ).__init__( plugin_manager )

		self._template_dir = None
		self._class_name = 'vtmpl.plugin.TemplateManager'

	def load( self ):
		"""
		This function is called by PyVim when vtmpl is loaded, this allows it to
		register callbacks, commands and anythings else that needs to be done at
		startup.
		"""
		_LOG.info( 'Loading %s %s', vtmpl.NAME, vtmpl.VERSION )

		# Look for the template dir
		if 'TEMPLATE_DIR' in os.environ and os.path.exists( os.environ[
				'TEMPLATE_DIR' ] ):
			self._template_dir = os.environ[ 'TEMPLATE_DIR' ]
		else:
			dirs = var( 'runtimepath' ).split( ',' )

			for _dir in dirs:
				if os.path.exists( _dir ) and os.path.isdir( _dir ):
					_content = os.listdir( _dir )
					if 'templates' in _content and os.path.isdir( os.path.join(
							_dir, 'templates' ) ):
						self._template_dir = os.path.join( _dir, 'templates' )
						break # break out of for

		if not self._template_dir:
			_LOG.warning( 'Failed to find any template directory!' )
		else:
			_LOG.info( 'Setting template dir to "%s"', self._template_dir )

		_LOG.debug( 'Registering commands.' )
		vim.command( 'command! -nargs=* LoadTemplate silent! %s(<f-args>)' %
				_get_func_name( self._class_name, 'load_template' ) )
		vim.command( 'command! -nargs=* ListTemplates %s(<f-args>)' %
				_get_func_name( self._class_name, 'list_templates' ) )

		_LOG.debug( 'Registering events' )
		vim.command( 'augroup vtmpl_events' )
		vim.command( 'au!' )
		vim.command( 'autocmd BufNewFile * silent! %s( "default" )' %
				_get_func_name( self._class_name, 'load_template' ) )
		vim.command( 'augroup END' )

	def unload( self ):
		"""
		This function is called by PyVim when unloading vtmpl, usually nothings
		needs to be done here but it is good practice to unregister everything
		that was registered in vim.
		"""
		_LOG.info( 'Unloading TemplateManager' )

		vim.command( 'delcommand LoadTemplate' )
		vim.command( 'delcommand ListTemplates' )

		vim.command( 'augroup vtmpl_events' )
		vim.command( 'au!' )
		vim.command( 'augroup END' )

	def load_template( self, name ):
		"""
		Try to load the template 'name' for the current filetype.
		"""
		filetype = var( 'ft' )

		_LOG.info( 'Trying to load template "%(name)s" for filetype "%(filetype)s".' % locals() )

		fdata = get_template( self._template_dir, filetype, name, vim.eval(
				'expand("%")' ), vim.eval( 'g:Context' ) )

		if fdata:
			_write_to_cbuffer( fdata )
		else:
			_LOG.info( 'Failed to load template "%(name)s" for filetype "%(filetype)s".' % locals() )

	def list_templates( self, partial='' ):
		"""
		Prints a list of templates for a specific filetype, if partial is used
		then the list is limited to templates which names contains partial.
		"""
		filetype = var( 'ft' )

		_LOG.info( 'Listing templates for filetype "%(filetype)s".', locals() )

		templates = get_template_list( self._template_dir, filetype, partial )

		print '\n'.join( templates )

def get_template_list( template_dir, filetype, partial ):
	"""
	Return a list of templates for a filetype, possibly limited by partial.
	"""
	_LOG.info( 'Listing templates for filetype "%(filetype)s".', locals() )
	if not filetype:
		_LOG.debug( 'No file type defined, using default.' )
		_dir = template_dir
	else:
		_dir = os.path.join( template_dir, filetype )

	_LOG.debug( 'Template dir for filetype "%s" is "%s".', filetype, _dir )

	if os.path.exists( _dir ) and os.path.isdir( _dir ):
		files = [ f.split( '-' )[0] for f in os.listdir( _dir )
				if partial in f.split( '-' )[0] ]

		if len( files ) == 0:
			_LOG.warning( 'No template found with the name "%(name)s"!' % locals() )
		else:
			_LOG.debug( 'Templates "%s".', repr( files ) )
	else:
		_LOG.warning( 'No templates exists for the filetype "%(filetype)s".' % locals() )
		files = []

	return files

def var( name ):
	"""
	Expands a vim variable.
	"""
	return vim.eval( '&%s' % name )

def _get_func_name( class_name, func_name ):
	"""
	Return's a string containing the code to execute a function on the
	TemplateManager object.
	"""
	# pylint: disable-msg=W0613
	return ':py manager.plugins["%(class_name)s"].%(func_name)s' % locals()

def _write_to_cbuffer( fdata ):
	"""
	This function applies the actual template to a buffer.
	"""
	buf, enc = vim.current.buffer, var( 'enc' )
	encode = codecs.encode

	# Remove the content of the current buffer
	del buf[:]

	if not fdata:
		_LOG.warning( 'Either the template is empty or the vtmpl failed to read it.' )
		return

	if len( fdata ) >= 1:
		buf[0] = encode( fdata[0], enc )

		for line in fdata[1:]:
			buf.append( encode( line, enc ) )

def get_template( template_dir, filetype='', name='default', fname='', context='' ):
	"""
	Returns a list with templates matching the name and filetype in the template
	dir.
	"""
	template = None

	if not filetype:
		_LOG.debug( 'No file type defined, using default.' )
		_dir = template_dir
	else:
		_dir = os.path.join( template_dir, filetype )

	_LOG.debug( 'Template dir for filetype "%s" is "%s".', filetype, _dir )

	if os.path.exists( _dir ) and os.path.isdir( _dir ):
		files = [ f for f in os.listdir( _dir ) if f.startswith( name ) ]

		if len( files ) == 0:
			_LOG.warning( 'No template found with the name "%(name)s"!' % locals() )
		else:
			_LOG.debug( 'Possible matches "%s".', repr( files ) )
			fname = get_template_fname( files, name, fname, context )

			_LOG.info( 'Loading template "%s"', fname )
			template = common.load_template( os.path.join( _dir, fname ) 
					).split( u'\n' )
	else:
		_LOG.warning( 'No templates exists for the filetype "%(filetype)s".' % locals() )

	return template

def get_template_fname( files, name, fname = '', context='' ):
	"""
	Given a list of files, this function will decide which file is the one to be
	used as a template.

	The templates are named according to this convention
	ft/name-ext-context.xxx, where ext and context are optional, xxx is a
	bit more special. The resolution order is done like this:

	When getting to this function all files already starts with name, then
	context and then ext, xxx is not used in anyway to resolv which file to use.

	If xxx is txt then the template is loaded as is, otherwise it is launch
	like a script and it's output is inserted in the buffer.
	"""
	if fname:
		ext = os.path.splitext( fname )[1][1:] # remove .
	else:
		ext = ''

	_LOG.debug( 'Resolving template filename, name: "%s", ext: "%s", context: "%s"',
			name, ext, context )

	def _compare( fname1, fname2 ):
		"""
		This function tries to, given two templates, decide which of the
		templates that should be used.
		"""
		frest1 = fname1[ len(name) + 1: fname1.rindex( '.' ) ].split( '-' )
		frest2 = fname2[ len(name) + 1: fname2.rindex( '.' ) ].split( '-' )

		ext1, context1 = frest1
		ext2, context2 = frest2

		if context1 == context and not context2 == context:
			return -1
		elif context2 == context and not context1 == context:
			return 1
		else:
			if ext1 == ext and not ext2 == ext:
				return -1
			if ext2 == ext and not ext1 == ext:
				return 1
			else:
				return 0

	files.sort( _compare )

	return files[0]
