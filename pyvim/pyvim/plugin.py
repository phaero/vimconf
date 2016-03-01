#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Plugin( object ):
	def __init__( self, manager ):
		self._plugin_manager = manager
	
	def get_plugin_name( self, class_name ):
		"""
		Returns the plugins name from Vims point of view. This should be
		changed!
		"""
		return ':py manager.plugins["%s"]' % class_name
	
	def load( self ):
		pass
	
	def unload( self ):
		pass

