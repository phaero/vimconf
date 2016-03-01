#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import logging

import pyvim

import vim

DEFAULT_DEV_CONFIG_FNAME = os.path.expanduser( '~/.vim/pyvim.plugins.dev.conf' )
DEFAULT_CONFIG_FNAME = os.path.expanduser( '~/.vim/pyvim.plugins.conf' )

def setup_logging( level=logging.DEBUG ):
	"""
	Setup logging.
	"""
	# TODO Add pid number to log file.
	logging.basicConfig( level=level,
			format='%(asctime)s %(levelname)-7s %(name)-8s %(message)s',
			filename='/tmp/pyvim.%(USER)s.log' % os.environ,
			filemode='a+' )

def vim_func( func ):
	"""
	This functions should be used to wrap functions that are used from vim code
	to catch exceptions and log them correctly.
	"""
	import traceback
	def new_func(*args, **kwargs):
		try:
			try:
				retval = func(*args, **kwargs)
			except:
				log.error( 'Caught exception: %s', traceback.format_exc() )
		finally:
			return

	# Override the local functions variables so it 'looks' correct
	new_func.__name__ = func.__name__
	new_func.__doc__ = func.__doc__
	new_func.__dict__.update(func.__dict__)

	return new_func

setup_logging()

log = logging.getLogger( 'pyvim' )

class RollbackImporter( object ):
	def __init__(self):
		'''
		Creates an instance and installs as the global importer
		'''
		self.previousModules = sys.modules.copy()
		self.realImport = __builtins__['__import__']
		__builtins__['__import__'] = self._import
		self.newModules = {}
		
	def _import( self, name, globals=None, locals=None, fromlist=[], level=-1 ):
		try:
			if not level == -1:
				result = apply( self.realImport, (name, globals, locals,
					fromlist, level ))
			else:
				result = apply(self.realImport, (name, globals, locals, fromlist))
		except:
			result = None

		self.newModules[name] = 1
		return result
		
	def uninstall(self):
		for modname in self.newModules.keys():
			if not self.previousModules.has_key(modname):
				# Force reload when modname next imported
				try:
					del(sys.modules[modname])
				except:
					pass
		__builtins__['__import__'] = self.realImport

class PluginManager( object ):
	def __init__( self ):
		"""
		Creates the plugin registery.
		"""
		self._vim_stderr = None
		self._replace_std_streams()

		self.plugins = {}
		self.funcs = {}

		self._config_fname = DEFAULT_CONFIG_FNAME

		if 'PYVIM_DEV' in os.environ:
			self.dev = True
			if os.path.exists( os.environ[ 'PYVIM_DEV' ] ) and os.path.isfile(
					os.environ[ 'PYVIM_DEV' ] ):
				self._dev_config_fname = os.environ[ 'PYVIM_DEV' ]
			else:
				self._dev_config_fname = DEFAULT_DEV_CONFIG_FNAME

			log.info( 'Activating DEV mode with config file "%s"!',
					self._dev_config_fname ) # Sounds very cool ;)
		else:
			self.dev = False

		self._rollback = None
		self._order = []

	def _replace_std_streams( self ):
		"""
		This function replaces stderr streams to a dummy file useful for logging
		and makes development in pyvim a lot more flexible since the vim
		implementation is a bit weird when it comes to exceptions...
		"""
		self._vim_stderr = sys.stderr
		sys.stderr = file( '/dev/null', 'w' )
	
	@vim_func
	def load( self ):
		"""
		Done at startup and reload of manager and configuration.
		"""
		log.info( 'Loading %s %s', pyvim.NAME, pyvim.VERSION )
		
		if self._order:
			self._unload_plugins()
			self._unload()
		
		if self._rollback:
			self._rollback.uninstall()
		
		self._rollback = RollbackImporter()

		self._load_config()
		
		self._load()
		self._load_plugins()
	
	@vim_func
	def activate_dev( self, conf_fname=DEFAULT_DEV_CONFIG_FNAME ):
		"""
		Activates developer mode and sets the configuration file to conf_name.
		"""
		log.info( 'Activating mode on the next reload with config file "%s".',
				conf_fname )
		self.dev = True
		self._dev_config_fname = conf_fname

	@vim_func
	def deactivate_dev( self ):
		"""
		Deactivates developer mode.
		"""
		log.info( 'Deactivation developer mode on next reload.' )
		self.dev = False

	def _load( self ):
		"""
		Register reload command.
		"""
		log.debug( 'Registering commands.' )
		vim.command( 'command! -nargs=0 PyVimReload silent! :py manager.load()' )
		vim.command( 'command! -nargs=? -complete=file PyVimDevMode silent! :py manager.activate_dev( <args> )' )
		vim.command( 'command! -nargs=0 PyVimNormalMode silent! :py manager.deactivate_dev()' )

	def _load_config( self ):
		"""
		Loading plugin configuration.
		"""
		log.debug( 'Loading plugin configuration.' )
		lines = []
		path = []

		if self.dev:
			fname = self._dev_config_fname
		else:
			fname = self._config_fname
		
		try:
			for line in file( fname, 'r' ):
				line = line.strip()

				if line.startswith( '#' ):
					continue # comment

				if line.startswith( 'path:' ):
					pass
				else:
					lines.append( line )
		except:
			log.error( 'Failed to load configuration file "%s".', fname )
			return
		
		self._order = lines
		self._python_path = list( sys.path )
	
	def _load_plugins( self ):
		"""
		Loads all the plugins and adds them to the plugin registery.
		"""
		log.info( 'Loading plugins' )
		for class_name in self._order:
			try:
				mod, cls = class_name.rsplit( '.', 1 )
				module = __import__( mod, globals(), {}, [ cls, ] )
				_class = getattr( module, cls )
				
				plugin = _class( self )

				try:
					plugin.load()
				except:
					# If this fails the plugin might have registered some of its
					# keybindings, events or commands and those should be
					# removed.
					plugin.unload()
					raise

				self.plugins[ class_name ] = plugin
			except ImportError, err:
				log.error( 'Failed to import "%s"! Got "%s".', class_name, 
						repr( err ) )
			except TypeError, err:
				log.error( 'Failed to import "%s"! Got "%s".', class_name, 
						repr( err ) )
			except AttributeError, err:
				log.error( 'Failed to import "%s"! Got "%s".', class_name, 
						repr( err ) )
	
	def _unload( self ):
		"""
		Unregisters events, commands and plugins.
		"""
		log.debug( 'Unregistering commands.' )
		vim.command( 'delcommand PyVimDevMode' )
		vim.command( 'delcommand PyVimReload' )
		vim.command( 'delcommand PyVimNormalMode' )
	
	def _unload_plugins( self ):
		"""
		Unloads all plugins.
		"""
		log.info( 'Unloading plugins.' )
		for plugin_name in self._order[::-1]:
			try:
				plugin = self.plugins[ plugin_name ]
				plugin.unload()

				del self.plugins[ plugin_name ]
			except KeyError:
				log.error( 'Failed to unload "%s".', plugin_name )

if __name__ == '__main__':
	pass
