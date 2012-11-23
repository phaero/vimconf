#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyvim.plugin
import logging

class TestPlugin( pyvim.plugin.Plugin ):
	def __init__( self ):
		self.name = 'TestPlugin'

	def load( self ):
		logging.debug( 'Loading "%s"', self.name )
	
	def unload( self ):
		logging.debug( 'Unloading "%s"', self.name )
