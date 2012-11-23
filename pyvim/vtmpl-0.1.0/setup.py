#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

import vtmpl

setup(
	name = vtmpl.NAME,
	version = vtmpl.VERSION,

	author='Johan Segolsson',
	author_email='johan.segolsson@gmail.com',

	packages=find_packages(),
	entry_points = {
		'console_scripts': [
			'vtmpl = vtmpl.script:main',
		],
	},

#	data_files = [
#		( 'doc', [
#			'doc/README',
#		] )
#	],

	dependency_links = [
		'http://www.segolsson.se/files/pkg/'
	],

	install_requires=[
		'setuptools',
		'pyvim>=0.0.4',
	],

	zip_safe = False,
)

