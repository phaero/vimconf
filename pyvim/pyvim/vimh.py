#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
This module will basically be a substitute for the regular vim module ( which
this will use but add some additional help functions ).
"""

import logging

import vim as _vim

log = logging.getLogger( 'vimh' )

def get( name ):
	return _vim.eval( '&%s' % name )

def set( name, value ):
	_vim.command( 'set %(name)s=%(value)s' % locals() )

def register_events( register, name, events ):
	"""
	Registers a list of events in vim.

	name is a string with the name of the plugin.

	events is a list of tuples, containing the event name, files it should
	match, the function that should be called and default arguments.
	"""
	group_name = '%(name)s_events' % locals()
	func_reg = ':py manager.funcs[ %(func_id)s ]'

	log.info( 'Register\'s events for %s.', name )
	_vim.command( 'augroup %(group_name)s' % locals() )
	_vim.command( 'au!' )

	for e in events:
		event, ftype, func, args = e

		func_id = '%s.%s.%s' % ( name, func.__module__, func.func_name )
		register[ func_id ] = func

		func_str = func_reg % locals()

		_vim.command( 'autocmd %(event)s %(ftype)s silent! %(func_str)s( %args)s )' % locals() )

	_vim.command( 'augroup END' )

def unregister_events( register, name, events ):
	"""
	Unregisters a list of events in vim.

	name is a string with the name of the plugin.

	events is a list of tuples, containing the event name, files it should
	match, the function that should be called and default arguments.
	"""
	group_name = '%(name)s_events' % locals()

	log.info( 'Register\'s events for %s.', name )
	_vim.command( 'augroup %(group_name)s' % locals() )
	_vim.command( 'au!' )
	_vim.command( 'augroup END' )

	for e in events:
		event, ftype, func, args = e

		func_id = '%s.%s.%s' % ( name, func.__module__, func.func_name )
		del register[ func_id ]
