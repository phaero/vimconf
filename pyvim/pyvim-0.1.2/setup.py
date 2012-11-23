#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

import pyvim

setup(
	name=pyvim.NAME,
	version=pyvim.VERSION,

	author='Johan Segolsson',
	author_email='johan.segolsson@gmail.com',

	packages=find_packages(),
	#entry_points = {
	#	'console_scripts': [
	#		'vim = qtm.test:vim_main',
	#	],
	#},

	#data_files = [ ( 'plugin', [ 'plugin/pyvim.vim', ] ) ],
	dependency_links = [
		'http://www.segolsson.se/files/pkg/'
	],

	install_requires=[ 'setuptools', ],
	zip_safe = False,
)

